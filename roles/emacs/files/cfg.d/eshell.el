(setq eshell-history-size 9999)
(setq eshell-aliases-file (concat dx15-files "/eshell.aliases"))
(setq dx15/truncate-eshell-buffers--timer
      (run-with-idle-timer 5 t #'dx15_eshell/truncate-eshell-buffers))

(defun eshell/gst (&rest args)
  (magit-status (car args))
  (eshell/echo))

(defun eshell/j (&rest args)
  (bookmark-maybe-load-default-file)
  (let ((path (bookmark-get-filename (car args))))
    (if (file-directory-p path)
        (eshell/cd path)
      (bookmark-jump name))))
