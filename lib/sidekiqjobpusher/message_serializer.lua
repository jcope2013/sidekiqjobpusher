if not cjson then
  cjson = require("cjson")
end
local rand = require "openssl.rand"
local bignum = require "openssl.bignum"
local MessageSerializer
do
  local _base_0 = {
    serialize = function(worker_class, args, retry, queue, at)
      queue = queue or 'default'
      -- jid = bignum.fromBinary(rand.bytes(10)) -- fix this
      -- return cjson.encode({
      --   class = worker_class,
      --   args = args,
      --   retry = retry
      -- })
      jid = '11'
      return cjson.encode({
        class = worker_class,
        args = args,
        retry = retry,
        queue = queue,
        jid = jid,
        created_at = os.time()
      })
      -- add enqueued_at if no at (immediate job)
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "MessageSerializer"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  MessageSerializer = _class_0
  return _class_0
end
