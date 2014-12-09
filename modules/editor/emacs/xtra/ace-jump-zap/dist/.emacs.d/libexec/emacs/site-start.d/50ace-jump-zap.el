; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'ace-jump-zap)
  (package-install 'ace-jump-zap))

(autoload
  'ace-jump-zap
  "ace-jump-zap"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "M-Z") 'ace-jump-zap-to-char)
(define-key global-map (kbd "M-z") 'ace-jump-zap-up-to-char)
