# -*- mode: Shell-script; sh-basic-offset: 2; -*-

function mnt_sec
{
  local ENCFS=/usr/bin/encfs
  local MOUNT=/bin/mount
  local WC=/usr/bin/wc
  local GREP=/bin/grep
  if [ -x "${ENCFS}" ]
  then
    if [ -d "${HOME}/.sec" ]
    then
      while [ "`\"${MOUNT}\" | \"${GREP}\" /home/dsouza/sec | \"${WC}\" -l`" != "1" ]
      do
        "${ENCFS}" "${HOME}/.sec" "${HOME}/sec"
      done
    fi
  fi
}

function exe_ext
{
  local EMACS="/usr/bin/emacs"
  local PIDOF="/bin/pidof"
  
  [ -f "${HOME}/.bashrc" ] && source "${HOME}/.bashrc"
  
  if [ -x "${EMACS}" ]
  then
    if [ -x "${PIDOF}" ]
    then
      ("${PIDOF}" "${EMACS}" || "${EMACS}" --daemon 2>/dev/null)&
    fi
  fi
}

function exp_env
{
  export SSH_ASKPASS=/usr/bin/ssh-askpass
  export JRE_HOME=/opt/jdk1.6.0_07/jre
  export JDK_HOME=/opt/jdk1.6.0_07
  export HISTFILE="${HOME}/.bash_history"
  export VISUAL="emacsclient -c"
  export EDITOR="emacsclient -c"
  export PAGER=/usr/bin/less
  export CDDA_DEVICE=/dev/cdrom
  export FTP_PASSIVE_MODE=1
  export LANG=en_US.UTF-8
  [ -x /usr/bin/dircolors ] && eval `/usr/bin/dircolors`
}

[ -f /etc/profile ] && source /etc/profile
[ -f "${HOME}/.bash_profile.local" ] && source "${HOME}/.bash_profile.local"
[ -f /etc/bash_completion ] && source /etc/bash_completion
exp_env
exe_ext
mnt_sec
