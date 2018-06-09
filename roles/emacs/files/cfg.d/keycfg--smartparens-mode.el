(require 'smartparens-config)

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
