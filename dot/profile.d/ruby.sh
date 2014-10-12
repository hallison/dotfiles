export RUBY_ENGINE=${RUBY_ENGINE:-ruby}
export RUBY_VERSION=${RUBY_VERSION:-2.1.2}
export GEM_HOME=$HOME/.gem/$RUBY_ENGINE/$RUBY_VERSION
export GEM_BINDIR=$GEM_HOME/bin
export RBENV_HOME=${RBENV_HOME:-$HOME/.rbenv}
export RBENV_BINDIR=$RBENV_HOME/bin
export RBENV_PROFILE=$HOME/.rbenvrc
export PATH=$RBENV_BINDIR:$GEM_BINDIR:$PATH

alias irb='irb -rubygems -rirb/completion'

rbenv init - > $RBENV_PROFILE && source $RBENV_PROFILE
