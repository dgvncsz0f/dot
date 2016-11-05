; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'smart-mode-line)
  (package-install 'smart-mode-line))

(require 'smart-mode-line)

(setq sml/theme 'dark)
(setq rm-blacklist ".")
(setq sml/no-confirm-load-theme t)

(sml/setup)
