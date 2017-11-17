; -*- mode: emacs-lisp; -*-

(require 'elisp-mode)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (turn-on-smartparens-strict-mode)
            (show-paren-mode t)
            (linum-mode t)
            (linum-relative-mode t)))
