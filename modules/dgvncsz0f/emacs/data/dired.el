(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-g") 'ack)
                                      (define-key dired-mode-map (kbd "M-n") 'next-error)
                                      (define-key dired-mode-map (kbd "M-p") 'previous-error)))
