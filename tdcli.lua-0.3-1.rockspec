package = "tdcli.lua"
version = "0.3-1"
source = {
  url = "git+https://github.com/rizaumami/tdcli.lua.git",
  tag = "v0.3",
}
description = {
  summary = "A simple Lua library for the telegram-cli.",
  detailed = [[
    tdcli.lua is a simple Lua library for the latest telegram-cli.
    The latest telegram-cli is more powerfull and flexible than its predecessor, but it's have a different interface so it won't be a drop-in replacement for the old telegram-cli based bots.
    Hence this tdcli.lua is written, to simplify the tedious and complicated telegram-cli's functions into simpler form.
  ]],
  homepage = "https://github.com/rizaumami/tdcli.lua",
  license = "GPL-3",
  maintainer = "Sahri Riza Umami <riza@openmailbox.org>",
}

dependencies = {
  "lua >= 5.1, < 5.4",
}

build = {
  type = "builtin",
  modules = {
    ["tdcli"] = "tdcli.lua",
  },
}
