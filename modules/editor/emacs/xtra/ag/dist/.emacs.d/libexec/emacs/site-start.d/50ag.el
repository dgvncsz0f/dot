; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'ag)
  (package-install 'ag))

(setq ag-arguments (list "--smart-case" "--stats" "--hidden" "--ignore" ".git/"))

(require 'ag)
