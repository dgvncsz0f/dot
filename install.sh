#!/bin/sh

ln_bin=/bin/ln
rm_bin=/bin/rm
mkdir_bin=/bin/mkdir
chmod_bin=/bin/chmod
env_bin=/usr/bin/env
git_bin=${GIT_BIN:-$(which git)}

dot_print_info()
{
  printf "%s\n" "$1"
}

dot_print_error()
{
  printf "ERROR - %s\n" "$1"
  exit 1
}

dot_check_binaries()
{
  if [ ! -x "$git_bin" ]
  then
    dot_print_error "git binary not found"
  fi

  if [ ! -x "$ln_bin" ]
  then
    dot_print_error "ln binary not found (really?)"
  fi

  if [ ! -x "$env_bin" ]
  then
    dot_print_error "env binary not found"
  fi

  if [ ! -x "$rm_bin" ]
  then
    dot_print_error "rm binary not found (really?)"
  fi
}

dot_mkdir()
{
  local dir=$1

  if [ ! -d "$dir" ]
  then
    $mkdir_bin "$dir"
  fi
}

dot_symlink()
{
  local src=$1
  local dst=$2

  if [ -d "$dst" ]
  then
    $rm_bin -r -f "$dst"
  fi

  $ln_bin -s -f -n "$src" "$dst"
}

dot_clone_dot()
{
  dot_print_info "CLONING DOT INTO $HOME/.dot"
  if [ -d "$HOME/.dot" ]
  then
    (cd "$HOME/.dot" && $git_bin reset --hard)
    (cd "$HOME/.dot" && $git_bin pull)
  else
    $git_bin clone git://github.com/dsouza/dot.git "$HOME/.dot"
  fi
}

dot_install_dot()
{
  dot_print_info "INSTALLING DOT FILES"

  dot_mkdir   "$HOME/.ssh"
  dot_symlink "$HOME/.dot/dot.ssh/config" "$HOME/.ssh/config"
  dot_symlink "$HOME/.dot/dot.emacs" "$HOME/.emacs"
  dot_symlink "$HOME/.dot/dot.libemacs" "$HOME/.libemacs"
  dot_symlink "$HOME/.dot/dot.viper" "$HOME/.viper"
  dot_symlink "$HOME/.dot/dot.vim" "$HOME/.vim"
  dot_symlink "$HOME/.dot/dot.vimrc" "$HOME/.vimrc"
  dot_symlink "$HOME/.dot/dot.bash_profile" "$HOME/.bash_profile"
  dot_symlink "$HOME/.dot/dot.bashrc" "$HOME/.bashrc"
  dot_symlink "$HOME/.dot/dot.zshrc" "$HOME/.zshrc"
  dot_symlink "$HOME/.dot/dot.conkerorrc" "$HOME/.conkerorrc"
  dot_symlink "$HOME/.dot/dot.gitconfig" "$HOME/.gitconfig"
  dot_symlink "$HOME/.dot/dot.inputrc" "$HOME/.inputrc"
  dot_symlink "$HOME/.dot/dot.screenrc" "$HOME/.screenrc"
  dot_symlink "$HOME/.dot/dot.xinitrc" "$HOME/.xinitrc"
  dot_symlink "$HOME/.dot/dot.xmobarrc" "$HOME/.xmobarrc"
  dot_symlink "$HOME/.dot/dot.xmodmaprc" "$HOME/.xmodmaprc"
  dot_symlink "$HOME/.dot/dot.xmonad" "$HOME/.xmonad"
  dot_symlink "$HOME/.dot/dot.xresourcesrc" "$HOME/.xresourcesrc"
  dot_symlink "$HOME/.dot/dot.mutt" "$HOME/.mutt"
  dot_symlink "$HOME/.dot/dot.email-signature" "$HOME/.email-signature"
}

dot_fixperms()
{
  $chmod_bin 0600 $HOME/.dot/dot.ig.fetchmailrc
}

dot_check_binaries
dot_clone_dot
dot_install_dot
dot_fixperms
