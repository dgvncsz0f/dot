; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'hexrgb)
  (package-install 'hexrgb))

(require 'hexrgb)
