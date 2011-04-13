# -*- mode: Shell-script; sh-basic-offset: 2; -*-

my_reg_als()
{
  alias :q=exit
  alias startx="/usr/bin/startx & exit; exit"
  alias tssh="/usr/bin/tsocks /usr/bin/ssh"
  alias tscp="/usr/bin/tsocks /usr/bin/scp"
  alias more="less"
  alias vi="vim"
  alias rm="/bin/rm -i"
  alias chroot32="/usr/bin/sudo -H /usr/sbin/chroot /var/chroot/sid-ia32"
  alias ls="ls -F"
  alias ll="ls -l"
  alias l1="ls -1"
  alias la="ll -a"
}

my_exp_env()
{
  export GPG_TTY=`tty`
  PS1='\n\u@\H \w \n(\j) \$ '
}

my_switch2zsh()
{
  if [ -x /bin/zsh ]
  then
    exec /bin/zsh
  else
    if [ -x /usr/bin/zsh ]
    then
      exec /usr/bin/zsh
    fi
  fi
}

[ -z "${PS1}" ] && return
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f "${HOME}/.bashrc.local" ] && source "${HOME}/.bashrc.local"

shopt -s checkwinsize
shopt -s histappend
shopt -s checkjobs
shopt -s globstar
shopt -s dirspell
shopt -s extglob
shopt -s extquote
shopt -s cdspell

my_reg_als
my_exp_env
my_switch2zsh

export GPG_TTY=$(tty)
