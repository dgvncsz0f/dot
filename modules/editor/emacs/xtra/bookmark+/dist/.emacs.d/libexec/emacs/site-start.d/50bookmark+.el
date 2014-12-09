; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'bookmark+)
  (package-install 'bookmark+))

(require 'bookmark+)
