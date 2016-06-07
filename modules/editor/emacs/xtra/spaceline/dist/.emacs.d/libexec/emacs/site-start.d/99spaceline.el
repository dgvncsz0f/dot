; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'powerline)
  (package-install 'powerline))

(unless (package-installed-p 'spaceline)
  (package-install 'spaceline))

(require 'powerline)
(require 'spaceline-config)
(spaceline-emacs-theme)
