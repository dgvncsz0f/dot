; -*- mode: emacs-lisp; -*-

(require 'eshell)

;; https://emacs.stackexchange.com/a/10874
(defun dx15_eshell/truncate-eshell-buffers ()
  "Truncates all eshell buffers"
  (interactive)
  (save-current-buffer
    (dolist (buffer (buffer-list t))
      (set-buffer buffer)
      (when (eq major-mode 'eshell-mode)
        (eshell-truncate-buffer)))))

(provide 'dx15_eshell)
