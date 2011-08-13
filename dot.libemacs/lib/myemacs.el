(defun my-open-shell-sideways 
  () 
  "Open shell in a window next to the current buffer"
  (split-window-vertically)
  (other-window) (shell))

(provide 'myemacs)
