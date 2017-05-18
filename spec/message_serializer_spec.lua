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
    }, true, 'default', '1')
    local params = {
      class = "MyWorker",
      args = {"arg1", "arg2"},
      retry = true,
      queue = "default",
      jid = tostring(os.time()),
      created_at = os.time(),
      enqueued_at = os.time()
    }
    return assert.are.same(serialised, cjson.encode(params))
  end)
  return it("can serialize without enqueued_at value", function()
    local serialised = ser.serialize('MyWorker', {
      'arg1',
      'arg2'
    }, true, 'default')
    local params = {
      class = "MyWorker",
      args = {"arg1", "arg2"},
      retry = true,
      queue = "default",
      jid = tostring(os.time())
    }
    return assert.are.same(serialised, cjson.encode(params))
  end)
end)
