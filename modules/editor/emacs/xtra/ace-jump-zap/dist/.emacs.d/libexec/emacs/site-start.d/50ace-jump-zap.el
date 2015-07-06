; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'ace-jump-zap)
  (package-install 'ace-jump-zap))

(require 'ace-jump-zap)
