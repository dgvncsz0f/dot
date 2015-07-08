; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'cider)
  (package-install 'cider))

(require 'cider-mode)

(setq cider-prefer-local-resources t)
(setq cider-repl-pop-to-buffer-on-connect nil)
(add-hook 'cider-mode-hook 'eldoc-mode)
