# Set LuaRocks path
if test -d $HOME/.luarocks; then
  PATH=$PATH:$HOME/.luarocks/bin
  alias lr='luarocks'
fi

