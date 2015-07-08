; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'cider-mode)
  (package-install 'cider-mode))

(require 'cider-mode)

(setq company-idle-delay nil)
(setq company-auto-complete nil)
(global-company-mode t)
