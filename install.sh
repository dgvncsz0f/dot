#!/bin/sh

ln_bin=/bin/ln
env_bin=/usr/bin/env
git_bin=${GIT_BIN:-$(which git)}

print_info()
{
  printf "%s\n" "$1"
}

dot_clone_dot()
{
  print_info "CLONING DOT INTO $HOME/.dot"
  if [ -d "$HOME/.dot" ]
  then
    $env_bin GIT_DIR="$HOME/.dot/.git" $git_bin pull -q
  else
    $git_bin clone -q git://github.com/dsouza/dot.git "$HOME/.dot"
  fi
}

dot_clone_zsh()
{
  print_info "CLONING OH-MY-ZSH INTO $HOME/.oh-my-zsh"
  if [ -d "$HOME/.oh-my-zsh" ]
  then
    $env_bin GIT_DIR="$HOME/.oh-my-zsh/.git" $git_bin pull -q
  else
    $git_bin clone -q git://github.com/dsouza/oh-my-zsh "$HOME/.oh-my-zsh"
  fi
}

dot_install_dot()
{
  print_info "INSTALLING DOT FILES"
  $ln_bin -s -f -n "$HOME/.dot/dot.emacs" "$HOME/.emacs"
  $ln_bin -s -f -n "$HOME/.dot/dot.libemacs" "$HOME/.libemacs"
  $ln_bin -s -f -n "$HOME/.dot/dot.viper" "$HOME/.viper"
  $ln_bin -s -f -n "$HOME/.dot/dot.vim" "$HOME/.vim"
  $ln_bin -s -f -n "$HOME/.dot/dot.vimrc" "$HOME/.vimrc"
  $ln_bin -s -f -n "$HOME/.dot/dot.bash_profile" "$HOME/.bash_profile"
  $ln_bin -s -f -n "$HOME/.dot/dot.bashrc" "$HOME/.bashrc"
  $ln_bin -s -f -n "$HOME/.dot/dot.conkerorrc" "$HOME/.conkerorrc"
  $ln_bin -s -f -n "$HOME/.dot/dot.gitconfig" "$HOME/.gitconfig"
  $ln_bin -s -f -n "$HOME/.dot/dot.inputrc" "$HOME/.inputrc"
  $ln_bin -s -f -n "$HOME/.dot/dot.screenrc" "$HOME/.screenrc"
  $ln_bin -s -f -n "$HOME/.dot/dot.xinitrc" "$HOME/.xinitrc"
  $ln_bin -s -f -n "$HOME/.dot/dot.xmobarrc" "$HOME/.xmobarrc"
  $ln_bin -s -f -n "$HOME/.dot/dot.xmodmaprc" "$HOME/.xmodmaprc"
  $ln_bin -s -f -n "$HOME/.dot/dot.xmonad" "$HOME/.xmonad"
  $ln_bin -s -f -n "$HOME/.dot/dot.xresourcesrc" "$HOME/.xresourcesrc"
  $ln_bin -s -f -n "$HOME/.dot/dot.muttrc" "$HOME/.muttrc"
  $ln_bin -s -f -n "$HOME/.dot/dot.mutt" "$HOME/.mutt"
}

dot_install_zsh()
{
  print_info "INSTALLING ZSH FILES"
  $ln_bin -s -f -n "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
}

dot_clone_dot
dot_install_dot
dot_clone_zsh
dot_install_zsh
