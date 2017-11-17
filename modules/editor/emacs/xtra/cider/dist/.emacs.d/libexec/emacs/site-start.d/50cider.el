; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'cider)
  (package-install 'cider))

(require 'cider-mode)
