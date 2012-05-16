(require 'epresent)

(define-key epresent-mode-map (kbd "+") 'epresent-increase-font)
(define-key epresent-mode-map (kbd "-") 'epresent-descrease-font)
(define-key epresent-mode-map (kbd "l") 'linum-mode)
(define-key org-mode-map (kbd "<f8>") 'epresent-run)
