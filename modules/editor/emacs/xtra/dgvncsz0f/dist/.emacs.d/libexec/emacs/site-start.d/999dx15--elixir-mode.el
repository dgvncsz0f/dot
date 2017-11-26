; -*- mode: emacs-lisp; -*-

(require 'elixir-mode)

(add-hook 'elixir-mode-hook
          (lambda ()
            (turn-on-smartparens-mode)
            (show-paren-mode t)
            (linum-mode t)
            (linum-relative-mode t)))