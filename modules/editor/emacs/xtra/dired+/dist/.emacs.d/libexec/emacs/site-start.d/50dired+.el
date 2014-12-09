; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'dired+)
  (package-install 'dired+))

(require 'dired+)
