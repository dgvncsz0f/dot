; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'expand-region)
  (package-install 'expand-region))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
