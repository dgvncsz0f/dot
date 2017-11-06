; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'switch-window)
  (package-install 'switch-window))

(require 'switch-window)
