; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'telephone-line)
  (package-install 'telephone-line))

(require 'telephone-line)

(setq telephone-line-lhs
      '((nil . (telephone-line-major-mode-segment
                telephone-line-airline-position-segment
                telephone-line-buffer-segment
                ))))

(setq telephone-line-rhs
      '((nil . (telephone-line-misc-info-segment
                telephone-line-minor-mode-segment))
        ))

(telephone-line-mode t)
