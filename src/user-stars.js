import consoleHeader from './lib/consoleHeader.js'
import cron from './cron.json' assert { type: 'json' }
import {App} from "octokit";
import api from "./lib/persistedGraphQL.js";
import fetchContributorNames from "./lib/contributorNameHelper.js";
import {p} from "@antfu/utils";
import {supabase} from "./lib/supabase.js";

const limitDays = parseInt(process.env.LIMIT_DAYS) || 1
let limitUsers = parseInt(process.env.LIMIT_USERS) || 5
const checked = {...cron.checked}
const lastExecuted = new Date()

const cache = {
  users: {},
  repos: {},
  contributions: {},
}
const que = {
  users: [],
  installations: [],
  repos: [],
  contributions: [],
}

consoleHeader(' OPEN |SAUCED', {
  font: 'block',
})
console.log(`Started execution at ${lastExecuted}`)

for (const item in checked) {
  const date = new Date(checked[item].lastExecuted)
  const diff = lastExecuted - date

  // generate a cache of items with offset dates
  cache.users[item] = {
    ...checked[item],
    offsetDays: Number(diff / 1000 / 60 / 60 / 24).toFixed(0)
  }
}

async function run() {
  const app = new App({
    appId: +process.env.OPEN_SAUCED_APP_ID,
    privateKey: process.env.OPEN_SAUCED_PRIVATE_KEY,
  })

  consoleHeader('Parsing cron')
  for await (const {installation} of app.eachInstallation.iterator()) {
    if (installation.account.login === 'open-sauced') {
      continue
    }

    // we don't have a local commit log of checking these installations
    if (typeof cache.users[installation.account.login] === 'undefined') {
      console.log(`${installation.account.login} is not in our cache, adding to the queue`)
      que.users.push(installation)
    } else {
      // we have a local cache of this installation
      let parsed = false

      if (
        cache.users[installation.account.login].offsetDays >= limitDays
      ) {
        que.users.push(installation)
        parsed = true
      }

      console.log(`${installation.account.login} has been checked ${
        cache.users[installation.account.login].offsetDays} days ago, ${parsed ? 'adding to the queue' : 'skipping'}`)
    }
  }

  consoleHeader('Parsing users')
  for await (const installation of que.users) {
    if (que.installations.length >= limitUsers) {
      break
    }

    console.log(`Fetching stars data for user ${installation.account.login}`)
    // check if we have access to open-sauced-goals repo and fail safe exit if not
    const installationExists = await app.octokit.rest.apps
      .getRepoInstallation({
        owner: installation.account.login,
        repo: 'open-sauced-goals',
      })
      .then(() => true)
      .catch((response) => {
        if (response.status === 404) {
          console.log(`${installation.account.login} is missing open-sauced-goals repo, flagging to skip`)
          checked[installation.account.login] = {
            owner: installation.account.login,
            notFound: true,
            lastExecuted,
          }
        } else {
          console.log(`Error getting repo installation for ${installation.account.login}`, response.toString())
        }

        return false
      })

    // if installation exists we proceed towards parsing
    if (installationExists) {
      const octokit = await app.getInstallationOctokit(installation.id)

      const {data: goalsRepo} = await octokit.rest.repos.get({
        owner: installation.account.login,
        repo: 'open-sauced-goals',
      }).catch((err) => {
        console.log(`${installation.account.login} open-sauced-goals: ${err}`)
        return {data: null}
      })

      const {data} = await octokit.rest.repos.getContent({
        owner: installation.account.login,
        repo: 'open-sauced-goals',
        path: 'stars.json'
      }).catch((err) => {
        console.log(`${installation.account.login} stars.json: ${err}`)
        return {data: {content: btoa("[]")}}
      })

      // convert from base64 to parseable JSON
      const content = Buffer.from(data.content, "base64").toString()
      const starsRepos = JSON.parse(content)
      const starsJsonExists = data.content.length > 0

      starsRepos.map(repo => que.repos.push({
        ...repo,
        installationId: installation.id
      }))

      que.installations.push({
        installation,
        starsRepos,
        starsJsonExists,
        goalsRepo,
      })
    }
  }

  consoleHeader('Parsing stars')
  console.log(`Existing cron queue was ${que.users.length}`)
  console.log(`Attempting to parse ${que.installations.length} users out of ${limitUsers} env.LIMIT_USERS`)

  const parsedRepos = await p(que.repos)
    .map(async (namedRepo) => {
      const [owner, repo] = namedRepo.full_name.split("/")
      const octokit = await app.getInstallationOctokit(namedRepo.installationId)

      // const currentRepoResponse = await octokit.rest.repos.get({user, repo})
      const {data: fetchedRepo, errors} = await octokit.rest.repos.get({owner, repo})
        .catch((err) => {
          return {errors: [err]}
        })

      if (errors && errors.length > 0) {
        console.log(`ERROR for ${owner}/${repo}`, errors)
        // reject(currentRepoResponse.errors)
        return errors
      }

      // insert into db
      const repository = {
        id: fetchedRepo.id,
        user_id: fetchedRepo.owner.id,
        full_name: namedRepo.full_name,
        name: repo,
        language: fetchedRepo.language,
        description: fetchedRepo.description,
        url: fetchedRepo.homepage,
        issues: fetchedRepo.open_issues,
        stars: fetchedRepo.stargazers_count,
        watchers: fetchedRepo.watchers_count,
        subscribers: fetchedRepo.subscribers_count,
        license: fetchedRepo.license ? fetchedRepo.license.spdx_id : `UNLICENSED`,
        isFork: !!fetchedRepo.fork,
        created_at: fetchedRepo.created_at,
        updated_at: fetchedRepo.updated_at,
        pushed_at: fetchedRepo.pushed_at,
      }

      await supabase
        .from('repos')
        .upsert(repository, {
          onConflict: "id"
        })

      cache.repos[namedRepo.full_name] = repository;
    })

  await p(que.installations)
    .map(async ({installation, starsRepos, starsJsonExists, goalsRepo}) => {
      console.log(`Processing installation #${installation.id}, ${installation.account.login} stars.json`)
      const octokit = await app.getInstallationOctokit(installation.id)

      // for await (const item of parsedData) {}
    })
}

await run()
