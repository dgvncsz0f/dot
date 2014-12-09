; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'dash)
  (package-install 'dash))

(require 'dash)
