
clientOpts =
  redis:
    port: 8220
    host: '192.168.59.103'

queue = require('../')(clientOpts)

queue.push 'hello', 'world', (error) ->
  console.log error

queue.push 'world', hello: 'world', (error) ->
  console.log error