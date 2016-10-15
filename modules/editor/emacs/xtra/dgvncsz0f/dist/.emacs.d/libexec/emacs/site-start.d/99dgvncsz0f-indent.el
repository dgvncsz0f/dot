; -*- mode: emacs-lisp; -*-

(c-add-style "dgvncsz0f" '("bsd"
                           (c-basic-offset . 2)
                           (substatement-open . 0)
                           ))
(add-hook 'c-mode-hook
          (lambda () (c-set-style "dgvncsz0f")))
(add-hook 'c++-mode-hook
          (lambda () (c-set-style "dgvncsz0f")))
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-basic-offset 2)
            (setq c-set-style "bsd")))
(add-hook 'js-mode-hook
          (lambda () (setq js-indent-level 2)))
(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2)))
(add-hook 'python-mode-hook
          (lambda ()
            (setq py-indent-offset 2)
            (modify-syntax-entry ?_ "_")))
