import consoleHeader from './lib/consoleHeader.js'
import api from "./lib/persistedGraphQL.js";
import fetchContributorNames from "./lib/contributorNameHelper.js";
import {p} from "@antfu/utils";
import {supabase} from "./lib/supabase.js";

const limitDays = parseInt(process.env.LIMIT_CONTRIBUTOR_DAYS) || 5
const lastExecuted = new Date()

consoleHeader(' OPEN |SAUCED', {
  font: 'block',
})
console.log(`Started execution at ${lastExecuted}`)

async function run() {
  const testDate = new Date(lastExecuted.getTime() - (limitDays * 24 * 60 * 60 * 1000))

  const {data: getAvailableRepo, error} = await supabase
    .from('repos')
    .select('*')
    .lte('last_fetched_contributors_at', testDate)
    .limit(1)
    .single()

  if (error) {
    console.log(`Unable to fetch repos from supabase`, error)
    return
  }

  console.log(getAvailableRepo);
  process.exit(1);
}

await run()
