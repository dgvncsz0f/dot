(add-hook 'clojure-mode-hook
          (lambda ()
            (setq cider-prefer-local-resources t
                  cider-repl-pop-to-buffer-on-connect nil)
            (eldoc-mode)
            (cider-mode)
            (turn-on-smartparens-strict-mode)
            (show-paren-mode t)
            (display-line-numbers-mode t)
            (cider-mode)))
