; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'dot-mode)
  (package-install 'dot-mode))

(require 'dot-mode)
(add-hook 'find-file-hooks 'dot-mode-on)
