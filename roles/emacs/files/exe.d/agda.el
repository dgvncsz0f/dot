; -*- mode: emacs-lisp; -*-

(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate 2>/dev/null")))

(require 'agda2)
(require 'agda2-highlight)
