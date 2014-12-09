; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'full-ack)
  (package-install 'full-ack))

(require 'full-ack)
