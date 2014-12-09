; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'col-highlight)
  (package-install 'col-highlight))

(require 'col-highlight)
