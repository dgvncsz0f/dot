(require 'yasnippet-bundle)

(yas/load-directory "~/.libemacs/yasnippets")

(setq yas/dont-activate t)
(global-set-key (kbd "C-c <C-tab>") 'yas/expand)
(define-key yas/keymap (kbd "M-n") 'yas/next-field)
(define-key yas/keymap (kbd "M-p") 'yas/prev-field)
