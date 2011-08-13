(defun my-open-shell-sideways 
  () 
  "Open shell in a window next to the current buffer"
  (interactive)
  (split-window-horizontally)
  (other-window 1) (shell))

(defun my-copy-line (&optional arg)
  " Do a kill-line but copy rather than kill.  This function
    directly calls kill-line, so see documentation of kill-line
    for how to use it including prefix argument and relevant
    variables.  This function works by temporarily making the
    buffer read-only.

    Reference: http://www.emacswiki.org/emacs/CopyingWholeLines
  "
  (interactive "P")
  (let ((buffer-read-only t)
        (kill-read-only-ok t))
    (kill-line arg)))

(provide 'myemacs)
