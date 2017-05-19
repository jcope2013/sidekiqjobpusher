package = "sidekiqjobpusher"
version = "1.0-1"
source = {
   url = "git://github.com/tomdmaguire/sidekiqjobpusher",
   tag = "v1.0"
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
   "lua ~> 5.1",
   "lua-cjson",
   "luasocket"
}
build = {
   type = "builtin",
   modules = {
      ['sidekiqjobpusher.client'] = "lib/sidekiqjobpusher/client.lua",
      ['sidekiqjobpusher.key_generator'] = "lib/sidekiqjobpusher/key_generator.lua",
      ['sidekiqjobpusher.message_serializer'] = "lib/sidekiqjobpusher/message_serializer.lua"
   }
}
