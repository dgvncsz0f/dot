; -*- mode: emacs-lisp; -*-

(require 'shell)

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2)
            (turn-on-smartparens-mode)
            (show-paren-mode t)
            (linum-mode t)
            (linum-relative-mode t)))