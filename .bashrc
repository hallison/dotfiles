function git_current_branch {
  branch=$(git branch 2> /dev/null | grep ^\* | tr -d \*\ )
  [[ $branch ]] && echo "[$branch]"
}

# Set my applications on path
declare -x PATH=$PATH:$HOME/programs/myscripts/bin
declare -x LS_OPTIONS='--color=auto'
declare -x EDITOR=vim

# Set my prompt
PS1='\u@\h:\w$(git_current_branch)\$ '

# Start aliases
for alias_source in $HOME/.aliases.d/*.alias; do
  source $alias_source
done
unset alias_source
