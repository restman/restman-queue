
clientOpts =
  redis:
    port: 8220
    host: '192.168.59.103'

queue = require('../')(clientOpts)

queue.process 'hello', (job, done) ->
  console.log job.data
  done()

queue.process 'world', (job, done) ->
  console.log job.data
  done()