export JENV_HOME=${JENV_HOME:-$HOME/.jenv}
export JENV_BINDIR=$JENV_HOME/bin
export JENV_PROFILE=$HOME/.jenvrc
export PATH=$JENV_BINDIR:$PATH

jenv init - > $JENV_PROFILE && source $JENV_PROFILE

