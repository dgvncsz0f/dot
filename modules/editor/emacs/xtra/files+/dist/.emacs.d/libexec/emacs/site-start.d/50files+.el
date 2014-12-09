; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'files+)
  (package-install 'files+))

(require 'files+)
