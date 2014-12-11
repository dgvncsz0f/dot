; -*- mode: emacs-lisp; -*-


(autoload
  'ace-jump-zap
  "ace-jump-zap"
  "ace-jump-zap"
  t)

(define-key global-map (kbd "M-z") 'ace-jump-zap-to-char)
(define-key global-map (kbd "M-Z") 'ace-jump-zap-up-to-char)
