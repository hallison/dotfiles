function prompt {
  function git_current_branch {
    branch=$(git branch 2> /dev/null | grep ^\* | tr -d \*\ )
    [[ $branch ]] && printf "[$branch]"
  }
  $@
}

# Set my applications on path
declare -x PATH=$PATH:$HOME/.local/bin:$HOME/.gem/ruby/1.8/bin
# Set 'ls' command options
declare -x LS_OPTIONS='--color=auto'
# Set my favorite editor
declare -x EDITOR=vim
# Set 'readline' command parameters for binds
declare -x INPUTRC=$HOME/.inputrc
# Set locale
declare -x LC_ALL=en_US
declare -x LC_CTYPE=UTF-8

# Set my prompt
PS1='\u@\h:\[\033[1;34m\]\w\[\033[0m\]\[\033[1;32m\]$(prompt git_current_branch)\[\033[0m\]\$ '

# Start aliases
for alias_source in $HOME/.aliases.d/*.alias; do
  source $alias_source
done
unset alias_source
