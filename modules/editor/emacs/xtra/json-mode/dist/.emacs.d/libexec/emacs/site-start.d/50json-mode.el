; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'json-mode)
  (package-install 'json-mde))

(require 'json-mode)
