; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'powerline)
  (package-install 'powerline))

(require 'powerline)
(powerline-default-theme)

