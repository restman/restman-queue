kue = require 'kue'

_client = {}

queue = (opts) ->
  _client = kue.createQueue(opts)
  queue

queue.push = (topic, data, callback) ->
  return callback new Error('restman-queue must be init') unless _client
  job = _client.create(topic, data)
  job.save callback

queue.process = (topic, callback) ->
  return callback new Error('restman-queue must be init') unless _client
  _client.process topic, callback

module.exports = queue