describe 'KeyGenerator', ->
  local gen

  before_each ->
    KeyGenerator = require 'sidekiqjobpusher.key_generator'
    gen = KeyGenerator!

  it "can genertate a key", ->
    key = gen.generate 'my_queue'
    assert.are.equal key, 'queue:my_queue'

  it "can genertate a namespaced key", ->
    key = gen.generate 'my_queue', 'my_namespace'
    assert.are.equal key, 'my_namespace:queue:my_queue'