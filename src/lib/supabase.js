import fs from 'node:fs/promises'
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
  const finalRow = rows.pop();
  const file = await fs.open(new URL(`../${filePath}`, import.meta.url), 'w');

  await file.write(`--
-- Data for Name: ${table}; Type: TABLE DATA; Schema: public; Timestamp: ${timestamp}
--

INSERT INTO ${table}("${columns.join('", "')}") VALUES
`);

  await p(rows)
    .map(async row => file.write(`(${columns.map(col => JSON.stringify(row[col])).join(', ')}),\n`))
    .then(() => file.write(`(${columns.map(col => JSON.stringify(finalRow[col])).join(', ')});\n`))

  await file.close()

  return {
    filePath,
    timestamp,
  }
};

export {
  supabase,
  supaCount,
  supaDump,
}
