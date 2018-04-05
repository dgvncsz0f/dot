; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'zoom)
  (package-install 'zoom))

(require 'zoom)

(custom-set-variables
 '(zoom-mode t)
 '(zoom-size '(0.7 . 0.7))
 '(zoom-ignored-major-modes '(ediff-mode dired-mode completion-list-mode)))
