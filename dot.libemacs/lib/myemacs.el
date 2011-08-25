(defun my-open-shell-sideways ()
  " Open shell in a window next to the current buffer "
  (interactive)
  (split-window-horizontally)
  (other-window 1) (shell))

(defun my-copy-line (&optional arg)
  " Do a kill-line but copy rather than kill.  This function
    directly calls kill-line, so see documentation of kill-line
    for how to use it including prefix argument and relevant
    variables.  This function works by temporarily making the
    buffer read-only.

    Reference: http://www.emacswiki.org/emacs/CopyingWholeLines
  "
  (interactive "P")
  (let ((buffer-read-only t)
        (kill-read-only-ok t))
    (kill-whole-line arg)))

(defun my-prepend-line (&optional arg)
  " Insert a newline before the current one. C-a C-o achieves the
    same result.
  "
  (interactive "P")
  (move-beginning-of-line arg)
  (open-line 1))

(defun my-append-line (&optional arg)
  " Insert a newline after the current one. C-e C-o achieves the
    same result.
  "
  (interactive "P")
  (move-end-of-line arg)
  (open-line 1)
  (forward-line 1))

(defun my-bytecompile-and-exit ()
  " Recompile ~/.emacs and everything under ~/.libemacs "
  (byte-recompile-directory "~/.libemacs" 0)
  (byte-compile-file "~/.emacs")
  (kill-emacs 0))

(defun my-toggle-flyspell ()
  " Toggles flyspell-mode.
  "
  (interactive)
  (if (symbol-value 'flyspell-mode)
      (flyspell-mode (- 1))
    (flyspell-mode)
    (flyspell-buffer)))

(defun my-x-as-term ()
  (interactive)
  (when 'window-system
    (lambda ()
      ((toolbar-mode (- 1))
       (menu-bar-mode (- 1))
       (scroll-bar-mode (- 1))))))

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 2)
  (setq c-set-style "bsd"))

(defun my-sh-mode-hook ()
  (setq sh-basic-offset 2))

(defun my-sgml-mode-hook ()
  (setq sgml-basic-offset 2))

(defun my-haskell-mode-hook ()
  (setq haskell-program-name "ghci"))

(defun my-icicle-mode-hook () ())

(defun my-js-mode-hook ()
  (setq js-indent-level 2))

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(defun my-org-kill-whole-line (&optional arg)
  "Simply put the point at beginning of line and invoke org-kill-line."
  (interactive "P")
  (move-beginning-of-line nil)
  (org-kill-line arg))

(defun my-org-mode-hook ()
  (make-variable-buffer-local 'yas/trigger-key)
  (setq yas/trigger-key [tab])
  (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
  (define-key yas/keymap [tab] 'yas/next-field)
  (define-key org-mode-map (kbd "C-k") 'my-org-kill-whole-line)
  (setq org-publish-project-alist
        '(

          ("dsouza-posts"
           :base-directory "~/dev/github/b/org"
           :base-extension "org"
           
           :recursive t
           :body-only t
           :auto-preamble nil
           :html-extension "html"
           :publish-function org-publish-org-to-html
           :publishing-directory "~/dev/github/b/_posts"
           )

          ("dsouza-static"
           :base-directory "~/dev/github/b/org"
           :base-extension "css\\|js\\|png\\|jpg\\|gif"

           :recursive t
           :publish-function org-publish-attachment
           :publishing-directory "~/dev/github/b/_static"
           )

          ("dsouza" :components ("dsouza-posts" "dsouza-static")))))

(provide 'myemacs)
