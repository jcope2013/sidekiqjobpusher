socket = require("socket")
return describe('MessageSerializer', function()
  local ser
  before_each(function()
    local MessageSerializer = require('sidekiqjobpusher.message_serializer')
    ser = MessageSerializer()
  end)
  it("can serialize with enqueued_at value", function()
    local serialised = ser.serialize('MyWorker', {
      'arg1',
      'arg2'
    }, true, 'default', '12', '1')
    local params = {
      class = "MyWorker",
      args = {"arg1", "arg2"},
      retry = true,
      queue = "default",
      jid = "12",
      created_at = socket.gettime(),
      enqueued_at = socket.gettime()
    }
    return assert.are.same(serialised, cjson.encode(params))
  end)
  return it("can serialize without enqueued_at value", function()
    local serialised = ser.serialize('MyWorker', {
      'arg1',
      'arg2'
    }, true, 'default', '11')
    local params = {
      class = "MyWorker",
      args = {"arg1", "arg2"},
      retry = true,
      queue = "default",
      jid = "11"
    }
    return assert.are.same(serialised, cjson.encode(params))
  end)
end)
