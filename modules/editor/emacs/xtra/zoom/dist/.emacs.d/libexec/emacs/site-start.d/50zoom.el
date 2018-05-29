; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'zoom)
  (package-install 'zoom))

(require 'zoom)

(custom-set-variables
 '(zoom-size '(0.9 . 0.9)))
