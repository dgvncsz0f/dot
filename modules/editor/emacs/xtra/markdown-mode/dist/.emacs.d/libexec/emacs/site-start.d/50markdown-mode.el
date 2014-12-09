; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

(require 'markdown-mode)
