; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'wgrep-ag)
  (package-install 'wgrep-ag))

(require 'wgrep-ag)
