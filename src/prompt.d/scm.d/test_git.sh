function _ps_scm {
  printf "%s" 'git'
}

function _ps_scm_cwd {
  __scm_cwd=${pwd}
  printf "%s" "${PWD}"
}

function _ps_scm_branch {
  printf "%s" "$(git branch 2> /dev/null | grep ^\* | tr -d '* \t')"
}

function _ps_scm_remote {
  printf "%s" "$(git config --get branch.$(_ps_scm_branch).remote)"
}

function _ps_scm_project {
  printf "%s" "$(git config --get remote)"
}

function _ps_scm_path {
  printf "%s" "$(_ps_scm_branch)/${PWD##${_scm_cwd}}"
}

function _ps_scm_commits {
  printf "%s" "$(printf "%06d" "$(($(git shortlog -sn | tr -d '[:alpha:][:punct:] \t' | tr '\n' '+')0))")"
}

function _ps_scm_changed {
  printf "%s" "$(git status &> /dev/null && echo ${_PS_CLR_RED} || echo ${_PS_CLR_GREEN})"
}

