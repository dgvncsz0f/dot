; -*- mode: emacs-lisp; -*-

(add-hook 'clojure-mode-hook
          (lambda () (cider-mode)))

(package-installed-p 'cider-mode)
