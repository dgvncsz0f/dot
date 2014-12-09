; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'icicles)
  (package-install 'icicles))

(require 'icicles)
