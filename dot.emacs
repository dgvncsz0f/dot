(add-to-list 'load-path "~/.libemacs/lib/icicles")
(add-to-list 'load-path "~/.libemacs/lib/")
(require 'fuzzy-match)
(require 'synonyms)
(require 'icicles)
(require 'color-theme)
(require 'zenburn)
(require 'epa-file)
(require 'col-highlight)
(require 'myemacs)
(require 'uniquify)
(require 'yasnippet-bundle)
(epa-file-enable)

(setq custom-file "~/.libemacs/custom.el")
(load custom-file)

(when (not (boundp 'ac-dictionary-directories)) (setq ac-dictionary-directories ()))
(add-to-list 'ac-dictionary-directories "~/.libemacs/lib/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-zenburn)))

(set-face-background 'col-highlight zenburn-bg-1)
(set-face-attribute 'mode-line nil :box nil)
(fset 'yes-or-no-p 'y-or-n-p)

; (show-ws-toggle-show-hard-spaces)
; (show-ws-toggle-show-tabs)
; (show-ws-toggle-show-trailing-whitespace)

(require 'framemove)
(windmove-default-keybindings 'super)
(setq framemove-hook-into-windmove t)

(yas/load-directory "~/.libemacs/yasnippets")

(speedbar (- 1))
(speedbar-add-supported-extension ".hs")
(speedbar-add-supported-extension ".h")
(speedbar-add-supported-extension ".c")
(speedbar-add-supported-extension ".cc")
(speedbar-add-supported-extension ".py")
(speedbar-add-supported-extension ".pl")
(speedbar-add-supported-extension ".rb")
(speedbar-add-supported-extension ".js")
(speedbar-add-supported-extension ".el")

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'sh-mode-hook 'my-sh-mode-hook)
(add-hook 'sgml-mode-hook 'my-sgml-mode-hook)
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
(add-hook 'org-mode-hook 'my-org-mode-hook)
(add-hook 'icicle-mode-hook 'my-icicle-mode-hook)
(add-hook 'js-mode-hook 'my-js-mode-hook)

(setq-default indent-tabs-mode nil)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq blink-matching-paren t)
(setq inhibit-startup-screen t)
(setq modeline-shadow-thickness 0)
(setq comment-multi-line t)
(setq mail-from-style 'angles)
(setq kill-whole-line t)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix nil)
(setq ac-auto-show-menu nil)

(show-paren-mode t)
(size-indication-mode t)
(global-font-lock-mode t)
(global-linum-mode t)
(global-hl-line-mode)
(column-number-mode t)
(visual-line-mode t)
(transient-mark-mode nil)
(icy-mode t)
(my-x-as-term)

(global-set-key (kbd "C-c v") 'view-mode)
(global-set-key (kbd "C-c s") 'my-open-shell-sideways)
(global-set-key (kbd "C-c w") 'my-copy-line)
(global-set-key (kbd "C-c c") 'describe-char)
(global-set-key (kbd "C-S-o") 'my-prepend-line)
(global-set-key (kbd "M-z") 'fastnav-zap-up-to-char-forward)
(global-set-key (kbd "M-Z") 'fastnav-zap-up-to-char-backward)
(global-set-key (kbd "C-c j") 'fastnav-jump-to-char-forward)
(global-set-key (kbd "C-c J") 'fastnav-jump-to-char-backward)
(global-set-key (kbd "C-o") 'my-append-line)
(global-set-key (kbd "<f5>") 'ispell-change-dictionary)
(global-set-key (kbd "S-<f5>") 'my-toggle-flyspell)
(global-set-key (kbd "<f6>") 'column-highlight-mode)
(global-set-key (kbd "S-<f6>") 'whitespace-mode)
(global-set-key (kbd "<f7>") 'visual-line-mode)
(global-set-key (kbd "S-<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "<f8>") 'compile)
(global-set-key (kbd "<f9>") 'speedbar)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-k") 'kill-line)
(global-set-key (kbd "M-p") 'yas/prev-field)
(global-set-key (kbd "M-n") 'yas/next-field)
(global-set-key (kbd "M-<up>") 'scroll-down)
(global-set-key (kbd "M-<down>") 'scroll-up)
(global-set-key (kbd "M-<right>") 'move-end-of-line)
(global-set-key (kbd "M-<left>") 'move-beginning-of-line)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(yas/load-directory "~/.libemacs/yasnippets")
