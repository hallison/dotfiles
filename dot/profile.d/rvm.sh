# RVM Settings
if test -s /etc/rvmrc; then
  . /etc/rvmrc
  . "$rvm_path/scripts/rvm"
elif test -s "$HOME/.rvm/scripts/rvm"; then
  . "$HOME/.rvm/scripts/rvm"
else
  : rvm not found
fi

