; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))

(require 'go-mode-load)
