(add-hook 'python-mode-hook
          (lambda ()
            (setq python-indent-offset 2)
            (modify-syntax-entry ?_ "_")))
