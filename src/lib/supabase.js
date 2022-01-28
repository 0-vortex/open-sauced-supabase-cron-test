import { open, readFile } from 'node:fs/promises'
import path from 'node:path'
import { createClient } from '@supabase/supabase-js'
import { p } from '@antfu/utils'

const anon_key = process.env.SUPABASE_ANON_KEY
const supabaseUrl = process.env.SUPABASE_URL

const supabase = createClient(supabaseUrl, anon_key)

const supaCount = async (table, field = 'id') => supabase
    .from(table)
    .select(field, {
      head: false,
      count: 'exact'
    })
    .range(0, 0)

const supaDump = async (basePath, table, columns = [], rows = []) => {
  const timestamp = new Date().toISOString()
  const filePath = path.join(basePath, `${table}.sql`)
  const finalRow = rows.pop()
  const file = await open(new URL(`../${filePath}`, import.meta.url).pathname, 'w')

  await file.write(`--
-- Data for Name: ${table}; Type: TABLE DATA; Schema: public; Timestamp: ${timestamp}
--

INSERT INTO ${table}(${columns.join(', ')}) VALUES
`)

  await p(rows)
    .map(async row => file.write(`(${columns.map(col => JSON.stringify(row[col]))
      .join(', ')
      .replaceAll('\\"', "'")
      .replaceAll("\\'", "'")
      .replaceAll("'", "''")
      .replaceAll('"', "'")}),\n`))
    .then(() => file.write(`(${columns.map(col => JSON.stringify(finalRow[col]))
      .join(', ')
      .replaceAll('\\"', "'")
      .replaceAll("\\'", "'")
      .replaceAll("'", "''")
      .replaceAll('"', "'")});\n`))

  await file.close()

  return {
    filePath,
    timestamp,
  }
}

const supaSeed = async (seeds) => {
  const file = await open(new URL(`../../supabase/seed.sql`, import.meta.url), 'w');

  await p(seeds)
    .map(async ({filePath}) => {
      console.log(`Seeding ${filePath} into supabase local database`)
      const data = await readFile(new URL(`../${filePath}`, import.meta.url), 'utf8')
      await file.write(data)
    })
    .then(() => file.close())
}

export {
  supabase,
  supaCount,
  supaDump,
  supaSeed,
}
