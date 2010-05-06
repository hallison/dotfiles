declare -x GIT_DIR=""

function _prompt_scm_check {
  test -d "${PWD}/.git"
}

function _prompt_scm_root {
  _prompt_scm_check && GIT_DIR=$PWD
  return $?
}

function _prompt_scm_project {
  project=${GIT_DIR##*/}
  test "$project" && printf "%s" "$project"
  unset project
}

function _prompt_scm_branch {
  local branch=$(git symbolic-ref HEAD 2> /dev/null)
  test -n $branch && printf "%s" "$branch"
  unset branch
}

function _prompt_scm_path {
  path=${PWD//*$GIT_DIR/}
  test "$path" && printf "%s" "$path" || printf "%s" "~"
  unset path
}

# Return remote name for a branch.
# Require branch name as argument.
function _prompt_scm_remote {
  branch=$(_prompt_scm_branch)
  remote=$(git config --get branch.$branch.remote)
  test $remote && printf "%s" "$remote"
  unset branch remote
}

# comand for changes
#git status &> /dev/null; [[ $? -eq 0 ]] && echo "+"

#function _prompt_gitprompt {}

function _prompt_scm_commits {
  #commits=$(git --git-dir="$gitdir" log 2> /dev/null | grep -c ^commit)
  commits=$(($(git shortlog -sn | tr -d '[:alpha:][:punct:] \t' | tr '\n' '+')0))
  [[ $commits ]] && printf "%06d" "${commits}"
  unset commits
}

function _prompt_scm_changed {
  git status &> /dev/null && _PS_COLOR_ON=${_PS_COLOR_RED} || _PS_COLOR_ON=${_PS_COLOR_GREEN}
  return $?
}

function _prompt_scm_init {
  _prompt_scm_root
  _prompt_scm_changed
  PS_SCM="git"
}

