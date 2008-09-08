function git_current_branch {
  branch=$(git branch 2> /dev/null | grep ^\* | tr -d \*\ )
  [[ $branch ]] && printf "[$branch]"
}

# Set my applications on path
declare -x PATH=$PATH:$HOME/programs/myscripts/bin
declare -x LS_OPTIONS='--color=auto'
declare -x EDITOR=vim
declare -x INPUTRC=$HOME/.inputrc

# Set my prompt
PS1='\u@\h:\[\033[1;34m\]\w\[\033[0m\]\[\033[1;32m\]$(git_current_branch)\[\033[0m\]\$ '

# Start aliases
for alias_source in $HOME/.aliases.d/*.alias; do
  source $alias_source
done
unset alias_source
