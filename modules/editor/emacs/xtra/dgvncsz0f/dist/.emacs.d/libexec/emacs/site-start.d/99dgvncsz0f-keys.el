; -*- mode: emacs-lisp; -*-

(require 'smartparens-config)

(add-hook 'dired-mode-hook
          (lambda () (define-key dired-mode-map (kbd "M-g") nil)))
(add-hook 'cider-mode-hook
          (lambda ()
            (define-key cider-mode-map (kbd "M-TAB") 'company-complete)
            (define-key cider-mode-map (kbd "C-c ,") 'dgvncsz0f--cider-test-run-tests)))
(add-hook 'emacs-lisp-mode-hook
          (lambda () (define-key emacs-lisp-mode-map (kbd "M-TAB") 'company-complete)))
(global-set-key (kbd "M-g l")
                (lambda (&optional args)
                  (interactive "sRegexp: ")
                  (ack args t (dgvncsz0f-project-root))))
(global-set-key (kbd "<f5>") 'ispell-change-dictionary)
(global-set-key (kbd "<f6>") 'column-highlight-mode)
(global-set-key (kbd "<f7>") 'visual-line-mode)
(global-set-key (kbd "<f8>") 'magit-status)
(global-set-key (kbd "<f9>") 'dgvncsz0f-compile-test)
(global-set-key (kbd "C-<f9>") 'dgvncsz0f-recompile)
(global-set-key (kbd "M-<f9>") 'dgvncsz0f-compile-clean)
(global-set-key (kbd "S-<f5>") 'dgvncsz0f-toggle-flyspell)
(global-set-key (kbd "S-<f6>") 'whitespace-mode)
(global-set-key (kbd "S-<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "S-<f8>") 'magit-blame)
(global-set-key (kbd "C-c ro") 'open-rectangle)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g g") 'avy-goto-line)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "C-c SPC") 'avy-goto-char)
(global-set-key (kbd "M-z") 'avy-zap-to-char-dwim)
(global-set-key (kbd "M-Z") 'avy-zap-up-to-char-dwim)
(global-set-key (kbd "C-c s") 'eshell)
(global-set-key (kbd "C-c C-e") 'dgvncsz0f-eval-and-replace)
(global-set-key (kbd "C-c f") 'dgvncsz0f-locate-file)
(global-set-key (kbd "C-c c") 'describe-char)
(global-set-key (kbd "C-S-o") 'dgvncsz0f-prepend-line)
(global-set-key (kbd "C-c U") 'browse-url-at-point)
(global-set-key (kbd "C-c u") 'browse-url)
(global-set-key (kbd "C-S-r") 'revert-buffer)
(global-set-key (kbd "C-o") 'dgvncsz0f-append-line)
(global-set-key (kbd "C-M-k") 'kill-whole-line)
(global-set-key (kbd "<C-return>") 'rectangle-mark-mode)
(global-set-key (kbd "C-c ro") 'open-rectangle)
(global-set-key (kbd "C-c C-SPC") 'erc-track-switch-buffer)
(global-set-key (kbd "M-TAB") 'company-complete)

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'minibuffer-setup-hook 'turn-on-smartparens-strict-mode)

(define-key smartparens-mode-map (kbd "M-F") 'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "M-B") 'sp-backward-sexp)

(define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key smartparens-mode-map (kbd "C-M-S-d") 'sp-backward-down-sexp)
(define-key smartparens-mode-map (kbd "C-M-a") 'sp-beginning-of-sexp)
(define-key smartparens-mode-map (kbd "C-M-e") 'sp-end-of-sexp)

(define-key smartparens-mode-map (kbd "C-M-u") 'sp-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-S-u") 'sp-backward-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)

(define-key smartparens-mode-map (kbd "C-M-f") 'sp-next-sexp)
(define-key smartparens-mode-map (kbd "C-M-b") 'sp-previous-sexp)

(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-hybrid-sexp)
(define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)
(define-key smartparens-mode-map (kbd "C-M-S-k") 'sp-kill-sexp)

(define-key smartparens-mode-map (kbd "C-S-b") 'sp-backward-symbol)
(define-key smartparens-mode-map (kbd "C-S-f") 'sp-forward-symbol)

(define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "M-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "M-<right>") 'sp-backward-barf-sexp)

(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "M-k") 'sp-backward-kill-sexp)
(define-key smartparens-mode-map (kbd "M-K") 'sp-splice-sexp)
(define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp-killing-around)

(define-key emacs-lisp-mode-map (kbd ";") 'sp-comment)
