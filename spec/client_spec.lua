return describe('Client', function()
  return it("schedules jobs", function()
    local redis = {
      lpush = (function(key, val) end)
    }
    local m = mock(redis)
    local Client = require('sidekiqjobpusher.client')
    local pusher = Client(m, 'my_namespace')
    pusher:perform('MyWorker', {
      arg1 = 'one',
      arg2 = 'two'
    }, true, 'my_queue')
    local expected_key = 'my_namespace:queue:my_queue'
    local expected_message = '{"args":{"arg1":"one","arg2":"two"},"class":"MyWorker","retry":true}'
    return assert.stub(redis.lpush).was.called_with(expected_key, expected_message)
  end)
end)
