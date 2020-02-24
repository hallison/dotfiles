export PYENV_HOME=${PYENV_HOME:-$HOME/.pyenv}
export PYENV_BINDIR=$PYENV_HOME/bin
export PYENV_PROFILE=$HOME/.pyenvrc
export PATH=$PYENV_BINDIR:$PATH

pyenv init - > $PYENV_PROFILE && source $PYENV_PROFILE
