return describe('MessageSerialiser', function()
  local ser
  before_each(function()
    local MessageSerialiser = require('sidekiqjobpusher.message_serialiser')
    ser = MessageSerialiser()
  end)
  return it("can serialise", function()
    local serialised = ser.serialise('MyWorker', {
      'arg1',
      'arg2'
    }, true)
    return assert.are.equal(serialised, '{"class":"MyWorker","args":["arg1","arg2"],"retry":true}')
  end)
end)
