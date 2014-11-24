package = "sidekiqjobpusher"
version = "1.0-1"
source = {
   url = "https://github.com/tomdmaguire/sidekiqjobpusher"
}
description = {
   summary = "Sidekiq API",
   detailed = [[
      Write Sidekiq jobs directly into redis
   ]],
   homepage = "https://github.com/tomdmaguire/sidekiqjobpusher",
   license = "MIT/X11"
}
dependencies = {
   "lua ~> 5.2",
   "lua-cjson",
   "redis-lua"
}
build = {
   type = "builtin",
   modules = {
      ['sidekiqjobpusher.client'] = "lib/sidekiqjobpusher/client.lua",
      ['sidekiqjobpusher.key_generator'] = "lib/sidekiqjobpusher/key_generator.lua",
      ['sidekiqjobpusher.message_serialiser'] = "lib/sidekiqjobpusher/message_serialiser.lua"
   }
}