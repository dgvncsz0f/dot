(add-hook 'python-mode-hook
          (lambda ()
            (setq py-indent-offset 2)
            (modify-syntax-entry ?_ "_")))
