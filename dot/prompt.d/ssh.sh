function _prompt_ssh_check {
  test -n $SSH_CONNECTION
}

function _prompt_ssh {
  PS_HOST="${PS_CLR_RED}\h${PS_CLR_OFF}"
}

