export RBENV_HOME=${RBENV_HOME:-$HOME/.rbenv}
export RBENV_BINDIR=$RBENV_HOME/bin
export RBENV_PROFILE=$HOME/.rbenvrc
export PATH=$RBENV_BINDIR:$PATH

rbenv init - > $RBENV_PROFILE && source $RBENV_PROFILE

export RUBY_ENGINE=$(ruby -e 'puts RUBY_ENGINE')
export RUBY_VERSION=$(ruby -e 'puts RUBY_VERSION')

export GEM_HOME=$HOME/.gem/$RUBY_ENGINE/$RUBY_VERSION
export GEM_BINDIR=$GEM_HOME/bin

export PATH=$GEM_BINDIR:$PATH

alias irb='irb -rubygems -rirb/completion'
