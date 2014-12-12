(require 'js)

(defun my-js-mode-hook ()
  (setq js-indent-level 2))

(add-hook 'js-mode-hook 'my-js-mode-hook)
