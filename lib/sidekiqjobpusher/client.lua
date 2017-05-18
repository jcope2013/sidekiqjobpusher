local Client
do
  local _base_0 = {
    perform = function(self, worker_class, arguments, retry, queue)
      if arguments == nil then
        arguments = { }
      end
      if retry == nil then
        retry = true
      end
      if queue == nil then
        queue = 'default'
      end
      local message = self.message_serializer.serialize(worker_class, arguments, retry, queue, '1')

      local key = self.key_generator.generate(queue, self.namespace)
      self.redis:sadd("queues", queue)
      return self.redis:lpush(key, message)
    end,

    perform_in = function(self, worker_class, arguments, at, retry, queue)
      if arguments == nil then
        arguments = { }
      end
      if retry == nil then
        retry = true
      end
      if queue == nil then
        queue = 'default'
      end

      local message = self.message_serializer.serialize(worker_class, arguments, retry, queue)
      return self.redis:zadd('schedule', at, message)
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self, redis, namespace)
      self.redis = redis
      self.namespace = namespace
      local KeyGenerator = require('sidekiqjobpusher.key_generator')
      self.key_generator = KeyGenerator()
      local MessageSerializer = require('sidekiqjobpusher.message_serializer')
      self.message_serializer = MessageSerializer()
    end,
    __base = _base_0,
    __name = "Client"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Client = _class_0
  return _class_0
end
