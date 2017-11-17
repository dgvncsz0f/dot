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
(global-set-key (kbd "<f6>") 'whitespace-mode)
(global-set-key (kbd "<f7>") 'visual-line-mode)
(global-set-key (kbd "<f9>") 'dgvncsz0f-compile-test)
(global-set-key (kbd "S-<f6>") 'column-highlight-mode)
(global-set-key (kbd "S-<f5>") 'dgvncsz0f-toggle-flyspell)
(global-set-key (kbd "S-<f7>") 'toggle-truncate-lines)
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
(global-set-key (kbd "C-c s") 'eshell)
(global-set-key (kbd "C-c C-e") 'dgvncsz0f-eval-and-replace)
(global-set-key (kbd "C-S-o") 'dgvncsz0f-prepend-line)
(global-set-key (kbd "C-c u") 'browse-url)
(global-set-key (kbd "C-S-r") 'revert-buffer)
(global-set-key (kbd "C-o") 'dgvncsz0f-append-line)
(global-set-key (kbd "C-M-k") 'kill-whole-line)
(global-set-key (kbd "C-c <C-return>") 'rectangle-mark-mode)
(global-set-key (kbd "C-c ro") 'open-rectangle)
(global-set-key (kbd "C-c C-SPC") 'erc-track-switch-buffer)
(global-set-key (kbd "M-TAB") 'company-complete)

(global-set-key (kbd "C-c p m s") 'magit-status)
(global-set-key (kbd "C-c p m t") 'git-timemachine)
(global-set-key (kbd "C-c p s a") 'projectile-ag)
(global-set-key (kbd "C-c p s g") 'projectile-grep)
(global-set-key (kbd "C-c p f") 'icicle-projectile-find-file)
(global-set-key (kbd "C-c p d") 'icicle-projectile-find-dir)
(define-key clojure-mode-map (kbd "C-c M-q") 'dgvncsz0f-zprint-this)

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
