; -*- mode: emacs-lisp; -*-

(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-g") 'ag)))
(global-set-key (kbd "<f5>") 'ispell-change-dictionary)
(global-set-key (kbd "<f6>") 'column-highlight-mode)
(global-set-key (kbd "<f7>") 'visual-line-mode)
(global-set-key (kbd "<f8>") 'magit-status)
(global-set-key (kbd "S-<f5>") 'dgvncsz0f-toggle-flyspell)
(global-set-key (kbd "S-<f6>") 'whitespace-mode)
(global-set-key (kbd "S-<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "S-<f8>") 'magit-blame)
(global-set-key (kbd "<C-return>") 'rectangle-mark-mode)
(global-set-key (kbd "C-c ro") 'open-rectangle)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(global-set-key (kbd "M-z") 'ace-jump-zap-to-char)
(global-set-key (kbd "M-Z") 'ace-jump-zap-up-to-char)
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c s") 'eshell)
(global-set-key (kbd "C-c C-e" 'dgvncsz0f-eval-and-replase))
(global-set-key (kbd "C-c c") 'describe-char)
(global-set-key (kbd "C-S-o") 'dgvncsz0f-prepend-line)
(global-set-key (kbd "C-c U") 'browse-url-at-point)
(global-set-key (kbd "C-c u") 'browse-url)
(global-set-key (kbd "C-S-r") 'revert-buffer)
(global-set-key (kbd "C-o") 'dgvncsz0f-append-line)
(global-set-key (kbd "C-x D") 'find-name-dired)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-M-k") 'kill-line)
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "M-<up>") 'scroll-down)
(global-set-key (kbd "M-<down>") 'scroll-up)
(global-set-key (kbd "M-<right>") 'move-end-of-line)
(global-set-key (kbd "M-<left>") 'move-beginning-of-line)
(global-set-key (kbd "C-c C-x C-e") 'eval-and-replace)
(global-set-key (kbd "<C-return>") 'rectangle-mark-mode)
(global-set-key (kbd "C-c ro") 'open-rectangle)
(global-set-key (kbd "C-c C-SPC") 'erc-track-switch-buffer)
