function _prompt_svncheck {
  test "$(svn info 2> /dev/null)"
}

# Return SVN root.
# Accepts -c for clean protocol header.
function _prompt_svnroot {
  root=$(svn info 2> /dev/null | grep Root | tr -d ' ')
  root=${root#*:}
  test "$1" == "-c" && root=${root#*://}
  test "$root" && printf "%s" "$root"
  return $?
}

# Return SVN path without protocol header
# Accepts -c as argument for clean protocol header and URL path.
function _prompt_svnpath {
  root=$(_prompt_svnroot -c)
  path=$(svn info 2> /dev/null | grep URL | tr -d ' ')
  path=${path#*:}
  test "$1" == "-c" && path=${path#*://} && path=${path##${root}/}
  test "$path" == "$(_prompt_svnroot $1)" && path="~"
  test "$path" && printf "%s" "$path"
  return $?
}

# Return SVN remote host.
# Accepts -c for clean domain and paths.
function _prompt_svnremote {
  remote=$(_prompt_svnroot -c); remote=${remote%%/*}
  test "$1" == "-c" && remote=${remote%%.*}
  test "$remote" && printf "%s" "$remote"
  return $?
}

function _prompt_svnbranch {
  branch=$(_prompt_svnpath -c)
  branch=${branch##branches/}
  branch=${branch%%/*}
  test "$branch" == "$(_prompt_svnremote)" && branch="head"
  test "$branch" && printf "%s" "$branch"
  return $?
}

function _prompt_svncommits {
  revision=$(svn info 2> /dev/null | grep Revision | tr -d '[:alpha:]: ')
  [[ $revision ]] && printf "%06d" "$revision"
  return $?
}

function _prompt_gitprompt {
  declare -x PS_SCM='svn'
  declare -x PS_HOST='$(_prompt_svnremote -c)'
  declare -x PS_PATH='$(_prompt_svnpath -c)'
  return $?
}

