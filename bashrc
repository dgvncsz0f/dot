# .bashrc 

function reg_als
{
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
}

function exp_env
{
  export GPG_TTY=`tty`
  PS1='\n\u@\H \w \n(\j) \$ '
}

[ -z "${PS1}" ] && return
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f "${HOME}/.bashrc.local"] && source "${HOME}/.bashrc.local"
shopt -s checkwinsize
shopt -s histappend
reg_als
exp_env
