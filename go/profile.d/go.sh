export GOENV_HOME=${GOENV_HOME:-$HOME/.goenv}
export GOENV_BINDIR=${GOENV_HOME}/bin
export GOENV_PROFILE=${HOME}/.goenvrc
export PATH=${GOENV_BINDIR}:${GOROOT}/bin:${GOPATH}/bin:${PATH}

goenv init - > $GOENV_PROFILE && source $GOENV_PROFILE
