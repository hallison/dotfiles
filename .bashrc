function prompt {
  function git_current_branch {
    gitdir="$PWD/.git"
    branch=$(git --git-dir="$gitdir" branch 2> /dev/null | grep ^\* | tr -d \*\ )
    commits=$(git --git-dir="$gitdir" log 2> /dev/null | grep -c ^commit)
    [[ $branch ]] && printf "SCM: Git on branch $branch with $commits commits"
  }

  function svn_current_revision {
    revision=$(svn info 2> /dev/null | grep Revision | tr -d /Revision:\ /)
    [[ $revision ]] && printf "SCM: Subversion in revision %04d" "$revision"
  }

  function directory_total_files {
    list=$(ls -lh)
    total=$(echo "$list" | grep "total" | tr -d "toal ")
    directories=$(grep -c ^d.* <<< "$list")
    files=$(grep -c ^-.* <<< "$list")
    links=$(grep -c ^l.* <<< "$list")
    printf "%d dirs, %d files, using %s" "$directories" "$files" "$total"
  }

  function directory_metainfo {
    metainfo=$(git_current_branch || svn_current_revision || echo "Common directory")
    [[ $metainfo ]] && printf "${metainfo}"
  }

  function foot {
    lmsg="[$(directory_total_files)]"
    cmsg="( $USER )"
    rmsg="[$(directory_metainfo)]"
    size=$((COLUMNS/2))
    lsize=$((${size}-${#lmsg}-${#cmsg}-2))
    rsize=$((${size}-${#rmsg}-${#cmsg}-2))
    border=$(printf "%-${#lmsg}s %0${lsize}d %${#cmsg}s %0${rsize}d %${#rmsg}s" "${lmsg}" 0 "${cmsg}" 0 "${rmsg}")
    echo "${border//0/-}"
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
PS1='\[\033[0m\]\[\033[1;32m\]$(prompt foot)\[\033[0m\]\[\033[1;34m\]\n\u@\h:\[\033[1;34m\]\w\[\033[0m\]\$ '

# Start aliases
for alias_source in $HOME/.aliases.d/*.alias; do
  source $alias_source
done
unset alias_source

