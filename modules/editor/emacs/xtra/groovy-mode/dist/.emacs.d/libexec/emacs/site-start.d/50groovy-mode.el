; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'groovy-mode)
  (package-install 'groovy-mode))

(require 'groovy-mode)
