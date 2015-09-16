; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'smartparens)
  (package-install 'smartparens))

(require 'smartparens)
(require 'smartparens-config)

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
