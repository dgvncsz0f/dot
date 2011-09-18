(when (not (boundp 'ac-dictionary-directories)) (setq ac-dictionary-directories ()))
(add-to-list 'ac-dictionary-directories "~/.libemacs/lib/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(setq ac-auto-show-menu nil)
