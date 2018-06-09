(add-hook 'python-mode-hook
          (lambda ()
            (setq python-indent-offset 2)
            (display-line-numbers-mode t)
            (modify-syntax-entry ?_ "_")))
