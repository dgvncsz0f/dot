; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'company)
  (package-install 'company))

(mapcar
 (lambda (p) (unless (package-installed-p p) (package-install p)))
 (list 'company-ghc 'company-cmake 'company-cabal 'company-c-headers))

(require 'company)

(setq company-idle-delay nil)
(setq company-auto-complete nil)
(global-company-mode t)
