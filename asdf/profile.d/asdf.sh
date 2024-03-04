export ASDF_HOME=${ASDF_HOME:-$HOME/.asdf}
export ASDF_BINDIR=$ASDF_HOME/bin
export ASDF_CONFIG=$ASDF_HOME/asdf.sh
export ASDF_COMPLETIONS=$ASDF_HOME/completions/asdf.bash
export ASDF_PROFILE=$HOME/.asdfrc
export PATH=$ASDF_BINDIR:$PATH

source $ASDF_CONFIG
source $ASDF_COMPLETIONS
