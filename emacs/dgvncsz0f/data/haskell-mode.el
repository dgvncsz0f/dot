(require 'haskell-mode)

(defun my-haskell-mode-hook ()
  (setq haskell-program-name "ghci"))

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
