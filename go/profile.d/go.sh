export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin

export GOENV_DISABLE_GOPATH=1

export GOENV_HOME=${GOENV_HOME:-$HOME/.goenv}
export GOENV_BINDIR=$GOENV_HOME/bin
export GOENV_PROFILE=$HOME/.goenvrc
export PATH=$GOENV_BINDIR:$PATH

goenv init - > $GOENV_PROFILE && source $GOENV_PROFILE
