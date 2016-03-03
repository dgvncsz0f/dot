; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'ace-window)
  (package-install 'ace-window))

(require 'ace-window)
