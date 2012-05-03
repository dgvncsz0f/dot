(require 'dired)

(when (not (member ".hi" dired-omit-extensions)) (setq dired-omit-extensions (cons ".hi" dired-omit-extensions)))
