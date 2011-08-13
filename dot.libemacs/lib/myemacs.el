(defun my-open-shell-sideways 
  () 
  "Open shell in a window next to the current buffer"
  (interactive)
  (split-window-horizontally)
  (other-window 1) (shell))

(provide 'myemacs)
