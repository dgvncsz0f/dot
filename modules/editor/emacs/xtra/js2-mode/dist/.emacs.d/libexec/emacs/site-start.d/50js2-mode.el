; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'js2-mode)
  (package-install 'js2-mode))

(require 'js)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook (lambda () (setq js-indent-level 2)))
