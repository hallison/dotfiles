export ASDF_HOME=${ASDF_HOME:-$HOME/.asdf}
export ASDF_BINDIR=$ASDF_HOME/bin
export ASDF_CONFIG=$ASDF_HOME/asdf.sh
export ASDF_COMPLETIONS=$ASDF_HOME/completions/asdf.bash
export ASDF_PROFILE=$HOME/.asdfrc

source $ASDF_CONFIG
source $ASDF_COMPLETIONS

# export PATH=$ASDF_BINDIR:$PATH
