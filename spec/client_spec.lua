return describe('Client', function()
  it("schedule jobs for a future time", function()
    local redis = {
      zadd = (function(key, at, val) end)
    }
    local m = mock(redis, true)
    local Client = require('sidekiqjobpusher.client')
    local pusher = Client(m)
    local expected_at = 1000
    pusher:perform_in('MyWorker', {
      arg1 = 'one',
      arg2 = 'two'
    }, 1000)
    local params = {
      class = "MyWorker",
      args = {
        arg1 = 'one',
        arg2 = 'two'
      },
      retry = true,
      queue = "default",
      jid = "11",
      created_at = os.time()
    }
    local expected_key = 'schedule'
    local expected_message = cjson.encode(params)
    return assert.stub(redis:zadd).was.called_with(expected_key, expected_at, expected_message)
  end)
  it("schedules jobs on a custom namespace", function()
    local redis = {
      lpush = (function(key, val) end)
    }
    local m = mock(redis, true)
    local Client = require('sidekiqjobpusher.client')
    local pusher = Client(m, 'my_namespace')
    pusher:perform('MyWorker', {
      arg1 = 'one',
      arg2 = 'two'
    }, true, 'my_queue')
    local params = {
      class = "MyWorker",
      args = {
        arg1 = 'one',
        arg2 = 'two'
      },
      retry = true,
      queue = "my_queue",
      jid = "11",
      created_at = os.time(),
      enqueued_at = os.time()
    }
    local expected_key = 'my_namespace:queue:my_queue'
    local expected_message = cjson.encode(params)
    return assert.stub(redis:lpush).was.called_with(expected_key, expected_message)
  end)
  return it("schedules jobs", function()
    local redis = {
      lpush = (function(key, val) end)
    }
    local m = mock(redis, true)
    local Client = require('sidekiqjobpusher.client')
    local pusher = Client(m)
    pusher:perform('MyWorker', {
      arg1 = 'one',
      arg2 = 'two'
    }, true, 'my_queue')
    local params = {
      class = "MyWorker",
      args = {
        arg1 = 'one',
        arg2 = 'two'
      },
      retry = true,
      queue = "my_queue",
      jid = "11",
      created_at = os.time(),
      enqueued_at = os.time()
    }
    local expected_key = 'queue:my_queue'
    local expected_message = cjson.encode(params)
    return assert.stub(redis:lpush).was.called_with(expected_key, expected_message)
  end)
end)
