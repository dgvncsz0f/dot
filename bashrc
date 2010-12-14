# -*- mode: Shell-script; sh-basic-offset: 2; -*-

function my_emacs()
{
  local pidof=/bin/pidof
  ${pidof} /usr/bin/emacs >/dev/null
  if [ "$?" == "0" ]
  then
    /usr/bin/emacsclient -c $@
  else
    /usr/bin/emacs $@
  fi
}

function my_reg_als
{
  alias :q=exit
  alias startx="/usr/bin/startx & exit"
  alias tssh="/usr/bin/tsocks /usr/bin/ssh"
  alias tscp="/usr/bin/tsocks /usr/bin/scp"
  alias more="less"
  alias vi="vim"
  alias rm="/bin/rm -i"
  alias chroot32="/usr/bin/sudo -H /usr/sbin/chroot /var/chroot/sid-ia32"
  alias ls="ls --color=auto"
  alias ll="ls --color=auto -l"
  alias l1="ls --color=auto -1"
  alias egrep="/bin/egrep --color=auto"
  alias grep="/bin/grep --color=auto"
  alias emacs=my_emacs

  [ -x /usr/bin/ack-grep ] && alias egrep="/usr/bin/ack-grep"
  [ -x /usr/bin/ack-grep ] && alias grep="/usr/bin/ack-grep"
}

function my_exp_env
{
  export GPG_TTY=`tty`
  PS1='\n\u@\H \w \n(\j) \$ '
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
# shopt -s nullglob
shopt -s extglob
shopt -s extquote
shopt -s cdspell

my_reg_als
my_exp_env
