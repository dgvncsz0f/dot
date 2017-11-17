(require 'magit-mode)

(setq vc-handled-backends nil)
(add-hook 'magit-mode-hook
          (lambda ()
            (show-paren-mode -1)
            (size-indication-mode -1)
            (column-number-mode -1)
            (visual-line-mode -1)
            (subword-mode -1)
            (linum-mode -1)
            (linum-relative-mode -1))
          nil t)
