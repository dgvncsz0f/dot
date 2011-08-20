#!/bin/sh

bin_ln=/bin/ln
bin_rm=/bin/rm
bin_mkdir=/bin/mkdir
bin_chmod=/bin/chmod
bin_env=/usr/bin/env
bin_git=${GIT_BIN:-$(which git)}
bin_find=/usr/bin/find
bin_xmonad=/usr/bin/xmonad
bin_emacs=/usr/bin/emacs

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
  [ ! -x "$bin_git" ] && dot_print_error "git binary not found"
  [ ! -x "$bin_ln" ]  && dot_print_error "ln binary not found (really?)"
  [ ! -x "$bin_env" ] && dot_print_error "env binary not found"
  [ ! -x "$bin_rm" ]  && dot_print_error "rm binary not found (really?)"
}

dot_mkdir()
{
  local dir=$1

  [ ! -d "$dir" ] && $bin_mkdir "$dir"
}

dot_symlink()
{
  local src=$1
  local dst=$2

  [ -d "$dst" ] && $bin_rm -r -f "$dst"
  [ -e "$src" ] && $bin_ln -s -f -n "$src" "$dst"
}

dot_clone_dot()
{
  dot_print_info "CLONING DOT INTO $HOME/.dot"
  if [ -d "$HOME/.dot" ]
  then
    (cd "$HOME/.dot" && $bin_git reset --hard)
    (cd "$HOME/.dot" && $bin_git pull)
  else
    $bin_git clone git://github.com/dsouza/dot.git "$HOME/.dot"
  fi
}

dot_install()
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
  dot_symlink "$HOME/.dot/dot.irssi" "$HOME/.irssi"
  dot_symlink "$HOME/.nickserv.auth" "$HOME/.irssi/nickserv.auth"
  dot_symlink "$HOME/.nickserv.networks" "$HOME/.irssi/nickserv.networks"
}

dot_fixperms()
{
  $bin_find $HOME/.dot -type d -exec $bin_chmod 0700 \{\} \;
  $bin_find $HOME/.dot -type f -exec $bin_chmod 0600 \{\} \;
  $bin_find $HOME/.dot/bin -type f -exec $bin_chmod 0700 \{\} \;
}

dot_post_xmonad()
{
  $bin_xmonad --recompile
}

dot_post_emacs()
{
  $bin_emacs -nw -f my-bytecompile
}

dot_postinst()
{
  dot_fixperms
  [ -x $bin_xmonad ] && dot_post_xmonad
  [ -x $bin_emacs ]  && dot_post_emacs
}


dot_check_binaries
dot_clone_dot
dot_install
dot_postinst
