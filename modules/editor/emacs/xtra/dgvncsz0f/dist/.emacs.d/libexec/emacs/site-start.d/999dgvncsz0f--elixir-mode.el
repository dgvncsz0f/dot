; -*- mode: emacs-lisp; -*-

(require 'elixir-mode)
(require 'smartparens)

(add-to-list 'elixir-mode-hook
             (lambda ()
               (turn-off-smartparens-strict-mode)))
