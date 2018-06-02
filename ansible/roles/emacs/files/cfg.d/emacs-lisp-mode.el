(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (turn-on-smartparens-strict-mode)
            (show-paren-mode t)
            (display-line-numbers-mode t)))
