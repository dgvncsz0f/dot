; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'highlight-symbol)
  (package-install 'highlight-symbol))

(require 'highlight-symbol)
