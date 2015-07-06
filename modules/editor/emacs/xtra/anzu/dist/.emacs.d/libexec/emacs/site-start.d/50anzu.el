; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'anzu)
  (package-install 'anzu))

(require 'anzu)
(global-anzu-mode 1)
