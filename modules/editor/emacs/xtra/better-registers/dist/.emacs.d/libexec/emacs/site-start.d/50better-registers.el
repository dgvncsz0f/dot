; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'better-registers)
  (package-install 'better-registers))

(require 'better-registers)
(better-registers-install-save-registers-hook)
