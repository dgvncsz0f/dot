(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (define-key emacs-lisp-mode-map (kbd ";") 'sp-comment)
            (define-key emacs-lisp-mode-map (kbd "M-TAB") 'company-complete)))
