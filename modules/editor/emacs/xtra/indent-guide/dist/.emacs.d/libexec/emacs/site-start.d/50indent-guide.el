; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'indent-guide)
  (package-install 'indent-guide))

(require 'indent-guide)
(indent-guide-global-mode 1)
