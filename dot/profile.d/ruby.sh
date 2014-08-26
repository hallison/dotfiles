export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin
alias irb='irb -rubygems -rirb/completion'
