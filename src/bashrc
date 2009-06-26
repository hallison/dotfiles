function prompt {

  function directory_scm_summary {
    metainfo=$(git_summary || svn_summary)
    [[ $metainfo ]] && echo "${metainfo}"
    return $?
  }

  function load_aliases {
    # Start aliases
    for alias_source in $HOME/.aliases.d/*.alias; do
      source $alias_source
    done
  }

  function completion {
    [[ -e /etc/bash_completion ]] && source /etc/bash_completion
  }

  $@
}
