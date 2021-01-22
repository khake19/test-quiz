const express = require('express')
const app = express()
const port = 3000

const { spawnSync } = require( 'child_process' );

app.get('/', (req, res) => {
  const html = spawnSync( 'diff2html', [ '-o', 'stdout' ] );
  res.send(html.stdout.toString())
})

app.listen(port, () => {
  console.log(`Diff service listening at http://localhost:${port}`)
})