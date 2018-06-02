(add-hook 'cider-mode-hook
          (lambda ()
            (define-key cider-mode-map (kbd "M-TAB") 'company-complete)))
