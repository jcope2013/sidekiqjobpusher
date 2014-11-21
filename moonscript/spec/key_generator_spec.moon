describe 'KeyGenerator', ->
  local gen

  before_each ->
    KeyGenerator = require 'sidekiqjobpusher.key_generator'
    gen = KeyGenerator!

  it "can genertate a key", ->
    -- KeyGenerator = require 'sidekiqjobpusher.key_generator'
    -- gen = KeyGenerator!
    key = gen.generate 'my_queue'
    assert.are.equal 'my_queue', key