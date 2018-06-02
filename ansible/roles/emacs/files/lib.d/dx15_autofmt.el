; -*- mode: emacs-lisp; -*-

(defun dx15_autofmt/zprint-buffer ()
  (interactive)
  (basic-save-buffer)
  (shell-command (concat "lein zprint " buffer-file-name)))

(defun dx15_autofmt/hfmt-buffer ()
  (interactive)
  (basic-save-buffer)
  (shell-command (concat "stack exec hfmt -- -w " buffer-file-name)))

(defun dx15_autofmt/mix-format-buffer ()
  (interactive)
  (basic-save-buffer)
  (shell-command (concat "mix format " buffer-file-name)))

(provide 'dx15_autofmt)
