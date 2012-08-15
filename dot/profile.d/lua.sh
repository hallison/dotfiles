# Set Lua environment
LUA_VERSION=${LUA_VERSION:-$(env -i lua -v 2>&1 | cut -c5-7)}
LUA_HOME=$HOME/.lua-$LUA_VERSION
test -d $LUA_HOME && {
  LUA_PATH=";;$LUA_HOME/share/lua/$LUA_VERSION/?.lua;$LUA_HOME/share/lua/5.1/?/init.lua"
  LUA_CPATH=";;$LUA_HOME/lib/lua/$LUA_VERSION/?.so"
  LUA_INIT='require "luarocks.loader"'
  PATH=$LUA_HOME/bin:$PATH

  export LUA_VERSION LUA_HOME LUA_PATH LUA_CPATH LUA_INIT PATH

  alias rock='luarocks'
  alias ilua='lua -l rlcompleter'
} || {
  unset LUA_VERSION
  unset LUA_HOME
}

