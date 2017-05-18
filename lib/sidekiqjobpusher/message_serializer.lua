if not cjson then
  cjson = require("cjson")
end
local MessageSerializer
do
  local _base_0 = {
    serialize = function(worker_class, args, retry, queue, enqueued_at)
      jid = '11'
      params = {
        class = worker_class,
        args = args,
        retry = retry,
        queue = queue,
        created_at = os.time()
      }
      if enqueued_at then params['enqueued_at'] = os.time() end
      return cjson.encode(params)
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
