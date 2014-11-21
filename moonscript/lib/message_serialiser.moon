export cjson = require "cjson" if not cjson

class MessageSeraliser
  serialise: (worker_class, args, retry) ->
    cjson.encode { class: worker_class, args: args, retry: retry }
