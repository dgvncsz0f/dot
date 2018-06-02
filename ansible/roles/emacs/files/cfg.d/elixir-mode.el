(add-hook 'elixir-mode-hook
          (lambda ()
            (turn-on-smartparens-mode)
            (show-paren-mode t)
            (display-line-numbers-mode t)))
