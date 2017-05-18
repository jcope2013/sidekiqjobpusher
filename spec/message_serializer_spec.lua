return describe('MessageSerializer', function()
  local ser
  before_each(function()
    local MessageSerializer = require('sidekiqjobpusher.message_serializer')
    ser = MessageSerializer()
  end)
  return it("can serialize", function()
    local serialised = ser.serialize('MyWorker', {
      'arg1',
      'arg2'
    }, true)
    return assert.are.equal(serialised, '{"class":"MyWorker","args":["arg1","arg2"],"retry":true}')
  end)
end)
