; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'lice)
  (package-install 'anzu))

(require 'lice)
