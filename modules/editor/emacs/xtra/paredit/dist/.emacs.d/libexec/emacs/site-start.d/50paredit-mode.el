(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(autoload 'enable-paredit-mode "paredit" "Turn on paredit-mode" t)

(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
