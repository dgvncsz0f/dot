; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))

(add-to-list 'load-path (concat user-emacs-directory "share/emacs/site-lisp/yasnippet"))

(require 'yasnippet)
