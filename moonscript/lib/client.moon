class Client
  new: (redis, namespace) ->
    @redis = redis
    @namespace = namespace
    KeyGenrator = require 'sidekiqjobpusher.key_generator'
    @key_generator = KeyGenrator!
    MessageSerialiser = require 'sidekiqjobpusher.message_serialiser'
    @messgae_serialiser = MessageSerialiser!

  perform: (worker_class, arguments = {}, retry = false, queue = 'default') ->
    key = @key_generator.generate queue, @namespace
    message = @messgae_serialiser.serialise worker_class, arguments, retry
    @redis\lpush key, message