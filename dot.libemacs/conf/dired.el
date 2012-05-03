(require 'dired)

(add-hook 'dired-mode-hook (lambda () (when (not (member ".hi" dired-omit-extensions)) (setq dired-omit-extensions (cons ".hi" dired-omit-extensions)))))
