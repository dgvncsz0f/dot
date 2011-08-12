#!/usr/bin/env zsh

source $HOME/.dot/dot.sh_shared

my_zsh_options()
{
  autoload colors;
  colors
}

my_zsh_history()
{
  export HISTFILE=$HOME/.zsh_history
  export SAVEHIST=10000
  export HISTSIZE=7500
  setopt hist_ignore_dups
  setopt share_history
  setopt inc_append_history
  setopt extended_history
}

my_zsh_keybindings()
{
  autoload edit-command-line
  zle -N edit-command-line
  bindkey -e "^[." insert-last-word
  bindkey -e "^X^E" edit-command-line
}

my_zsh_correction()
{
  setopt   NO_BANG_HIST
  unsetopt CORRECT
  unsetopt CORRECT_ALL
  unsetopt MENU_COMPLETE
}

my_zsh_completion()
{
}

my_zsh_prompt()
{
  export PS1="%{$fg_bold_red%}➜ %{$fg_bold_grey%}|%n@%M| %{$fg_bold_cyan%}%~ "$'\n'"%{$fg_bold_yellow%}%#%{$nocolors%} "
}

my_colors
my_zsh_options
my_zsh_prompt
my_setenv
my_editors
my_aliases
my_encfs
my_loadrvm
my_zsh_history
my_zsh_keybindings
my_zsh_correction
my_zsh_completion
