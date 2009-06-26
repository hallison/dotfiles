declare -x PS_USER='\u'
declare -x PS_HOST='\h'
declare -x PS_PATH='\w'
declare -x PS_SCM=""
declare -x PS_INFO=""
declare -x PS_FORMAT=""

function _prompt_init {
  basepath=$(dirname ${BASH_SOURCE})
  for file in $basepath/prompt.d/*.sh; do
    source $file
  done

  _prompt_scm && _prompt_scm_format || _prompt_common_format
#  _prompt_ssh && _prompt_ssh_format || _prompt_common_format
}

function _prompt_common_format {
  PS_FORMAT="${PS_USER}@${PS_HOST}:${PS_PATH}\$ "
}

echo "${PS_FORMAT}"
