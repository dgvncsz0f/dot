; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'smartparens)
  (package-install 'smartparens))

(require 'smartparens)
