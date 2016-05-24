; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'ag)
  (package-install 'ag))

(require 'ag)
