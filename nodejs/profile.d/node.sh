export NODENV_HOME=${NODENV_HOME:-$HOME/.nodenv}
export NODENV_BINDIR=$NODENV_HOME/bin
export NODENV_PROFILE=$HOME/.nodenvrc
export PATH=$NODENV_BINDIR:$PATH

nodenv init - > $NODENV_PROFILE && source $NODENV_PROFILE

# export NPM_PATH=$HOME/.npm
# export PATH=$PATH:$NPM_PATH/bin
