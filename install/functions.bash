#!/usr/bin/env bash
# bash < <(curl nikitug.com/bashit/server.sh)

__bashit_log()  { printf "$*\n" ; return $? ;  }
__bashit_fail() { __bashit_log "\nERROR: $*\n" ; exit 1 ; }

__bashit_update_git()
{
  if [ -d "${bashit_path}/.git" ]
  then
    # already cloned
    pushd "${bashit_path}"
    git pull --rebase origin "${bashit_repo_branch}"
    popd
  else
    local ssh_url public_url

    ssh_url="git@github.com:${bashit_repo}.git"
    public_url="git://github.com/${bashit_repo}.git"

    # clone ssh or public repo
    if git clone "${ssh_url}" "${bashit_path}" #>/dev/null 2>&1
    then
      true
    else
      if git clone "${public_url}" "${bashit_path}" #>/dev/null 2>&1
      then
        true
      else
        __bashit_fail "Failed to clone git repo ${ssh_url} to ${bashit_path}"
      fi
    fi

    pushd "${bashit_path}"
    [[ -n $(git branch | grep "${bashit_repo_branch}") ]] || checkout_opt="-b"
    git checkout "${checkout_opt}" "${bashit_repo_branch}"
    popd
  fi
}

__bashit_update_archive()
{
  local archive archives_path url

  archives_path="/tmp/bashit_archives"
  archive="${archives_path}/latest.tar.gz"
  url="http://github.com/${bashit_repo}/tarball/${bashit_repo_branch}"

  rm -rf "${archives_path}"
  mkdir -p "${archives_path}"

  if curl -L "${url}" -o "${archive}" #>/dev/null 2>&1
  then
    true
  else #
    __bashit_fail "Failed to download ${url} to ${archive} using 'curl', error code ($?)"
  fi

  if tar zxf "${archive}" -C "${archives_path}/" --no-same-owner #>/dev/null 2>&1
  then
    true
  else
    __bashit_fail "Failed to extract ${archive} to ${bashit_path}/,"\
      "tar command returned error code $?"
  fi

  if [ -d "${bashit_path}" ]
  then
    while true
    do
      read -p "${bashit_path} will be completely rewritten. Are you shure? [Y/N] " RESP

      case $RESP in
        [yY])
          break
          ;;
        [nN])
          return 1
          ;;
        *)
          echo "Please enter Y or N"
          ;;
      esac
    done
  fi

  rm -rf "${bashit_path}"
  mv "${archives_path}/`tar -tf ${archive} | head -n1 | sed 's/^\(.*\)\/$/\1/'`" "${bashit_path}"
}

__bashit_update()
{
  if which git >/dev/null 2>&1
  then
    if [ -d "${bashit_path}" -a ! -d "${bashit_path}/.git" ]
    then
      __bashit_log "Seems like bash-it was installed from archive last time, but now we can use git."
      while true
      do
        read -p "${bashit_path} will be completely rewriteen. Are you shure? [Y/N] " RESP

        case $RESP in
          [yY])
            rm -rf "${bashit_path}"
            break
            ;;
          [nN])
            return 1
            ;;
          *)
            echo "Please enter Y or N"
            ;;
        esac
      done
    fi

    if __bashit_update_git
    then
      __bashit_log "bash-it has been successfully updated as git repo to ${bashit_path}"
    fi
  else
    # git is anavailable, unpack archive
    if __bashit_update_archive
    then
      __bashit_log "bash-it has been successfully updated from archive to ${bashit_path}"
    fi
  fi
}

__bashit_disable_all()
{
  for type in "aliases" "plugins" "completion"
  do
    rm -rf "$bashit_path/$type/enabled"
  done
}

__bashit_install_common()
{
  [[ -s "${bashit_path}/install/${bashit_install_configuration}/common.bash" ]] && source "${bashit_path}/install/${bashit_install_configuration}/common.bash"
}

__bashit_install_remote()
{
  [[ -s "${HOME}/.bash_profile" ]] && cp "${HOME}/.bash_profile" "${HOME}/.bash_profile.bak"
  cp "${bashit_path}/template/nikitug/bash_profile.remote.bash" "${HOME}/.bash_profile"
  [[ -s "${HOME}/.bashrc" ]] && cp "${HOME}/.bashrc" "${HOME}/.bashrc.bak"
  cp "${bashit_path}/template/nikitug/bashrc.remote.bash" "${HOME}/.bashrc"

  [[ -s "${bashit_path}/install/${bashit_install_configuration}/remote.bash" ]] && source "${bashit_path}/install/${bashit_install_configuration}/remote.bash"
}

__bashit_install_local()
{
  [[ -s "${HOME}/.bash_profile" ]] && cp "${HOME}/.bash_profile" "${HOME}/.bash_profile.bak"
  cp "${bashit_path}/template/nikitug/bash_profile.local.bash" "${HOME}/.bash_profile"
  [[ -s "${HOME}/.bashrc" ]] && cp "${HOME}/.bashrc" "${HOME}/.bashrc.bak"
  cp "${bashit_path}/template/nikitug/bashrc.local.bash" "${HOME}/.bashrc"

  [[ -s "${bashit_path}/install/${bashit_install_configuration}/local.bash" ]] && source "${bashit_path}/install/${bashit_install_configuration}/local.bash"
}

__bashit_update_remote()
{
  if __bashit_update
  then
    __bashit_disable_all
    __bashit_install_common
    __bashit_install_remote
  fi
}

__bashit_update_local()
{
  if __bashit_update
  then
    __bashit_disable_all
    __bashit_install_common
    __bashit_install_local
  fi
}

