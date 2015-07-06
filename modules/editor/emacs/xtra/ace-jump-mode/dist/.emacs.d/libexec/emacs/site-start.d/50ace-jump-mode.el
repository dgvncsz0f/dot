; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'ace-jump-mode)
  (package-install 'ace-jump-mode))

(require 'ace-jump-mode)

(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

