function mnt_sec
{
  local ENCFS=/usr/bin/encfs
  local MOUNT=/bin/mount
  local WC=/usr/bin/wc
  if [ -x "${ENCFS}" ]; then
    if [ -d "$HOME/.sec" ]; then
      while [ "`${MOUNT} | grep /home/dsouza/sec | ${WC} -l`" != "1" ]; do
        ${ENCFS} $HOME/.sec $HOME/sec
      done
    fi
  fi
}

function exe_ext
{
  [ -f "$HOME/.bashrc" ] && source $HOME/.bashrc
}

function exp_env
{
  export SSH_ASKPASS="/usr/bin/ssh-askpass"
  export JRE_HOME="/opt/jdk1.6.0_07/jre"
  export JDK_HOME="/opt/jdk1.6.0_07"
  export HISTFILE=$HOME/.bash_history
  export VISUAL="emacsclient"
  export EDITOR="emacsclient"
  export PAGER="less"
  export CDDA_DEVICE="/dev/cdrom"
  export HGENCODING="utf-8"
  export PATH=$PATH:$JDK_HOME/bin:$HOME/bin:$HOME/usr/bin
  export FTP_PASSIVE_MODE=1
  export LANG=en_US.UTF-8
  #export TZ=America/Sao_Paulo
  export BOOST_ROOT=/usr/local/share/boost_build
  export FTP_PASSIVE_MODE=1
  export DARCS_PAGER=
  [ -x /usr/bin/dircolors ] && eval `/usr/bin/dircolors`

  readonly FTP_PASSIVE_MODE
  readonly BOOST_ROOT
  readonly PATH
  readonly PAGER
  readonly EDITOR
  readonly VISUAL
  readonly HISTSIZE
  readonly HISTFILE
  readonly JDK_HOME
  readonly JRE_HOME
  readonly SSH_ASKPASS
  readonly HISTFILESIZE
}

[ -f /etc/profile ] && source /etc/profile
[ -f "${HOME}/.bash_profile.local" ] && source "${HOME}/.bash_profile.local"
exp_env
exe_ext
mnt_sec
