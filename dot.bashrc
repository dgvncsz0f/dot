# -*- mode: Shell-script; sh-basic-offset: 2; -*-

source $HOME/.dot/dot.sh_shared

my_bash_prompt()
{
  export PS1="\[$fg_bold_red\]➜ \[$fg_bold_grey\]|\\u@\\H| \[$fg_norm_cyan\]\\w \\n \[$fg_bold_yellow\](\\j) \\$ \[$nocolors\]"
}

my_bash_history()
{
  export HISTFILE=$HOME/.bash_history
  export HISTFILESIZE=10000
  export HISTSIZE=7500
}

my_bash_options()
{
  shopt -s histappend
  shopt -s extglob
  shopt -s extquote
  shopt -s cdspell
}

[ -z "${PS1}" ] && return
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f "${HOME}/.bashrc.local" ] && source "${HOME}/.bashrc.local"

my_bash_options
my_colors
my_setenv
my_editors
my_aliases
my_encfs
my_loadrvm
my_bash_history
my_bash_prompt
