(require 'dired)

(add-hook 'dired-mode-hook (lambda () (setq dired-omit-extensions (cons ".hi" dired-omit-extensions))))
