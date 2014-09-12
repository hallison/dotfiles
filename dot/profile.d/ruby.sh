export RUBY_ENGINE=${RUBY_ENGINE:-ruby}
export RUBY_VERSION=${RUBY_VERSION:-2.1.2}
export GEM_HOME=$HOME/.gem/$RUBY_ENGINE/$RUBY_VERSION
export GEM_BINDIR=$GEM_HOME/bin
export PATH=$PATH:$GEM_BINDIR

alias irb='irb -rubygems -rirb/completion'
