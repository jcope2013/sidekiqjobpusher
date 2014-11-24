describe 'Client', ->
  it "schedules jobs", ->
    redis = { lpush: ((key, val) -> return) }
    m = mock(redis)

    Client = require 'sidekiqjobpusher.client'
    pusher = Client(m, 'my_namespace')

    pusher\perform 'MyWorker', { arg1: 'one', arg2: 'two' }, true, 'my_queue'
    
    expected_key = 'my_namespace:queue:my_queue'
    expected_message = '{"args":{"arg1":"one","arg2":"two"},"class":"MyWorker","retry":true}'
    assert.stub(redis.lpush).was.called_with expected_key, expected_message