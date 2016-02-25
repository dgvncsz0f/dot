; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'avy)
  (package-install 'avy))

(require 'avy)
