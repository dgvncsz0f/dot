(add-hook 'dired-mode-hook
          (lambda () (define-key dired-mode-map (kbd "M-g") nil)))
