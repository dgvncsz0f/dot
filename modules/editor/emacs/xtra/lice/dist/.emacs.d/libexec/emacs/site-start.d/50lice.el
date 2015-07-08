; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'lice)
  (package-install 'lice))

(require 'lice)
