test -r $HOME/.luavmrc && . $HOME/.luavmrc

alias rock='luarocks'
alias ilua='lua -l rlcompleter'

LUAROCKS_HOME=$HOME/.luarocks

test -d $LUAROCKS_HOME && {
  case ":$PATH:" in
    *":$LUAROCKS_HOME:"*) : $LUAROCKS_HOME # already in path
      ;;
    *) PATH=$LUAROCKS_HOME/bin:$PATH
      ;;
  esac
}

