(add-hook 'haskell-mode-hook
          (lambda ()
            (intero-mode 1)
            (turn-on-haskell-indentation)
            (turn-on-smartparens-mode)
            (show-paren-mode t)
            (display-line-numbers-mode t)))
