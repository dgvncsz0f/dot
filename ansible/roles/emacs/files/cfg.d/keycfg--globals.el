;; editing/visual
(global-set-key (kbd "<f6>") 'whitespace-mode)
(global-set-key (kbd "<f7>") 'visual-line-mode)
(global-set-key (kbd "S-<f6>") 'column-highlight-mode)
(global-set-key (kbd "S-<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "C-S-r") 'revert-buffer)
(global-set-key (kbd "C-M-k") 'kill-whole-line)
(global-set-key (kbd "C-c <C-return>") 'rectangle-mark-mode)
(global-set-key (kbd "C-c ro") 'open-rectangle)

;; company
(global-set-key (kbd "M-TAB") 'company-complete)

;; magit/project
(global-set-key (kbd "C-c p m s") 'magit-status)
(global-set-key (kbd "C-c p m t") 'git-timemachine)
(global-set-key (kbd "C-c p s a") 'projectile-ripgrep)
(global-set-key (kbd "C-c p s g") 'projectile-grep)
(global-set-key (kbd "C-c p f") 'icicle-projectile-find-file)
(global-set-key (kbd "C-c p d") 'icicle-projectile-find-dir)

;; evil-numbers
(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; spell-checker
(global-set-key (kbd "<f5>") 'ispell-change-dictionary)
(global-set-key (kbd "S-<f5>") 'dx15/toggle-flyspell)

;; zoom
(global-set-key (kbd "C-x +") 'zoom)

;; avy-char
(global-set-key (kbd "<M-return>") 'avy-goto-line)
(global-set-key (kbd "<C-return>") 'avy-goto-char)
(global-set-key (kbd "M-z") 'avy-zap-to-char-dwim)
(global-set-key (kbd "M-Z") 'avy-zap-up-to-char-dwim)

;; switch-window
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
(global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
(global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
(global-set-key (kbd "C-x 0") 'switch-window-then-delete)

;; highlight-symbol
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; eshell
(global-set-key (kbd "C-c s") 'eshell)

;; dx15
(global-set-key (kbd "C-c C-e") 'dx15/eval-and-replace)
(global-set-key (kbd "C-S-o") 'dx15/prepend-line)
(global-set-key (kbd "C-o") 'dx15/append-line)
