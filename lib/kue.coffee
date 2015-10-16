kue = require 'kue'

module.exports = (opts) ->
  queue = {}
  queue.client = kue.createQueue(opts)
  queue.opts = opts
  queue.push = (topic, data, callback) ->
    return callback new Error('restman-queue must be init') unless @client
    job = @client.create(topic, data)
    job.save callback

  queue.process = (topic, callback) ->
    return callback new Error('restman-queue must be init') unless @client
    @client.process topic, callback
  queue
