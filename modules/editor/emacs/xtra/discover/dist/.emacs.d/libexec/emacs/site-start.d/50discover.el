; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'discover)
  (package-install 'discover))

(require 'discover)