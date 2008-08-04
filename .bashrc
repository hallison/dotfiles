function git_current_branch {
  branch=$(git branch 2> /dev/null | grep ^\* | tr -d \*\ )
  [[ $branch ]] && echo "[$branch]"
}

# Set my applications on path
declare -x PATH=$PATH:$HOME/programs/myscripts/bin

# Set my prompt
PS1='\u@\h:\w$(git_current_branch)\$ '

# Settings my aliases
source ${HOME}/.aliases
