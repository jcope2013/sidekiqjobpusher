describe 'MessageSerialiser', ->
  local ser

  before_each ->
    MessageSerialiser = require 'sidekiqjobpusher.message_serialiser'
    ser = MessageSerialiser!

  it "can serialise", ->
    serialised = ser.serialise 'MyWorker', { 'arg1', 'arg2' }, true
    assert.are.equal serialised, '{"class":"MyWorker","args":["arg1","arg2"],"retry":true}'