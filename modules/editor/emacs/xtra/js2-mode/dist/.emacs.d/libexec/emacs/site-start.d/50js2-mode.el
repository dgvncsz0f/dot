; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'js2-mode)
  (package-install 'js2-mode))

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
