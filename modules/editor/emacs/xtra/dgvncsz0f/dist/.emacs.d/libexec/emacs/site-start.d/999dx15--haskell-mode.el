; -*- mode: emacs-lisp; -*-

(require 'haskell-mode)
(require 'intero)

(add-hook 'haskell-mode-hook
          (lambda ()
            (intero-mode 1)
            (turn-on-haskell-indentation)
            (turn-on-smartparens-mode)
            (show-paren-mode t)
            (linum-mode t)
            (linum-relative-mode t)))
