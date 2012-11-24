(require 'python)

(defun my-python-mode-hook ()
  (setq py-indent-offset 2)
  (modify-syntax-entry ?_ "_"))

(add-hook 'python-mode-hook 'my-python-mode-hook)
