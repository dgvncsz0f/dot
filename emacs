(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-midnight)))

(set-face-attribute 'mode-line nil :box nil)
(fset 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)
(show-ws-toggle-show-hard-spaces)
(show-ws-toggle-show-tabs)
; (show-ws-toggle-show-trailing-whitespace)

(setq-default indent-tabs-mode nil)
(setq-default auto-save-default nil)
(setq-default tab-width 4)
(setq-default blink-matching-paren t)
(setq-default inhibit-startup-screen t)
(setq-default modeline-shadow-thickness 0)
(setq-default cua-toggle-set-mark nil)
(setq-default cua-enable-cua-keys nil)
(setq-default ido-enable-flex-matching t)
(setq-default c-default-style "bsd")
(setq-default c-basic-offset 2)
(setq-default comment-multi-line t)

(global-font-lock-mode t)
(global-linum-mode t)
(line-number-mode t)
(column-number-mode t)
(cua-mode t)
(ido-mode t)

(add-hook 'text-mode-hook 'auto-fill-mode t)
(add-hook 'text-mode-hook 'flyspell-mode t)

(define-key ctl-x-map "a" 'align-string)
(define-key ctl-x-map "c" 'ispell-buffer)
(define-key ctl-x-map "\C-q" 'view-mode)
(define-key ctl-x-map "\M-k" 'erase-buffer)
(global-set-key [S-f12] 'next-error)

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(server-start)