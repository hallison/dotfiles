function _prompt_scm {
  basepath=$(dirname ${BASH_SOURCE})
  git branch &> /dev/null && source $basepath/scm.d/git.sh
  svn info   &> /dev/null && source $basepath/scm.d/svn.sh

  _prompt_scm_init

}

function _prompt_scm_format {
  PS_INFO="[${_PS_COLOR_CYAN}${PS_SCM}:$(_prompt_scm_project)${_PS_COLOR_OFF} ${_PS_COLOR_ON}r$(_prompt_scm_commits)${_PS_COLOR_OFF}]"
  PS_USER=$(_prompt_scm_branch)
  PS_HOST=$(_prompt_scm_remote)
  PS_PATH=$(_prompt_scm_path)
  PS_FORMAT="${PS_INFO} ${PS_USER}@${PS_HOST}: ${_PS_COLOR_CYAN}${PS_PATH}${_PS_COLOR_OFF}\$ "
}
