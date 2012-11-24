(require 'cc-mode)

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 2)
  (setq c-set-style "bsd"))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
