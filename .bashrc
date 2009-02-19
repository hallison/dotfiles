function prompt {
  function git_current_branch {
    gitdir="$PWD/.git"
    branch=$(git --git-dir="$gitdir" branch 2> /dev/null | grep ^\* | tr -d '* \t')
    [[ $branch ]] && printf "%s" "${branch}"
    return $?
  }

  function git_current_commits {
    gitdir="$PWD/.git"
    commits=$(git --git-dir="$gitdir" log 2> /dev/null | grep -c ^commit)
    [[ $commits ]] && printf "%04d" "${commits}"
    return $?
  }

  function git_summary {
    branch=$(git_current_branch)
    commits=$(git_current_commits)
    [[ $branch && $commits ]] && printf "%s" "(git $(git_current_branch), r$(git_current_commits))"
    return $?
  }

  function svn_current_revision {
    revision=$(svn info 2> /dev/null | grep Revision | tr -d /Revision:\ /)
    [[ $revision ]] && printf "%04d" "$revision"
    return $?
  }

  function svn_summary {
    revision=$(svn_current_revision)
    [[ $revision ]] && printf "%s" "(svn r$(svn_current_revision))"
    return $?
  }

  function directory_total_files {
    list=$(ls -lh)
    size=$(echo "$list" | grep "total" | tr -d "toal ")
    directories=$(grep -c ^d.* <<< "$list")
    files=$(grep -c ^-.* <<< "$list")
    links=$(grep -c ^l.* <<< "$list")
    printf "Directories: %03d - Files: %03d - Size %0.2f%sB" "$directories" "$files" "$(tr -d [A-Z] <<< $size)" "$(tr -d [0-9.] <<< $size)"
    return $?
  }

  function directory_scm_summary {
    metainfo=$(git_summary || svn_summary)
    [[ $metainfo ]] && echo "${metainfo}"
    return $?
  }

  $@
}

# Set my applications on path
declare -x PATH=$PATH:$HOME/.local/bin:$HOME/.gem/ruby/1.8/bin
# Set 'ls' command options
declare -x LS_OPTIONS='--color=auto --group-directories-first'
# Set my favorite editor
declare -x EDITOR=vim
# Set 'readline' command parameters for binds
declare -x INPUTRC=$HOME/.inputrc
# Set locale
declare -x LC_ALL=en_US
declare -x LC_CTYPE=UTF-8

# Set my prompt
PS_COLOR_SUMMARY='\[\033[0;36m\]'
PS_COLOR_SCM='\[\033[0;36m\]'
PS_COLOR_PATH='\[\033[0;34m\]'
PS_COLOR_OFF='\[\033[0m\]'
#PS1="$PS_COLOR_SUMMARY[\$(prompt directory_total_files)]${PS_COLOR_OFF}
PS1="\u@\h:${PS_COLOR_PATH}\w${PS_COLOR_OFF}${PS_COLOR_SCM}\$(prompt directory_scm_summary)${PS_COLOR_OFF}\$ "

# Start aliases
for alias_source in $HOME/.aliases.d/*.alias; do
  source $alias_source
done
unset alias_source

