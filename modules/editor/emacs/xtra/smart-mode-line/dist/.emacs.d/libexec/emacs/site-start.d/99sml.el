; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'smart-mode-line)
  (package-install 'smart-mode-line))

(require 'smart-mode-line)

(setq rm-blacklist ".")
(setq sml/theme 'respectful)
(setq sml/no-confirm-load-them t)

(sml/setup)
