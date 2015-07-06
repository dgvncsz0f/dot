; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'discover-my-major)
  (package-install 'discover-my-major))

(require 'discover-my-major)
