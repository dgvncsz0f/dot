; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'smart-mode-line)
  (package-install 'smart-mode-line))

(require 'smart-mode-line)

(setq rm-blacklist ".")
(setq sml/theme nil)

(sml/setup)
