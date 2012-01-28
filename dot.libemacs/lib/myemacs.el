(defun my-open-shell-sideways ()
  " Open shell in a window next to the current buffer "
  (interactive)
  (split-window)
  (other-window 1)
  (shell))

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

(defun my-icicle-mode-hook ()
  (when (symbol-value icicle-mode)
    (setq icicle-incremental-completion-flag t)
    (define-key icicle-mode-map (kbd "C-c f") 'icicle-locate-file)))

(defun my-js-mode-hook ()
  (setq js-indent-level 2))

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(defun my-org-kill-whole-line (&optional arg)
  "Simply put the point at beginning of line and invoke org-kill-line."
  (interactive "P")
  (move-beginning-of-line nil)
  (org-kill-line arg))

(defun my-w3m-mode-hook ()
  (w3m-link-numbering-mode))

(defun my-delete-prefix (pfx str)
  (if (string-prefix-p pfx str)
      (substring str (length pfx))
    str
    ))

(defun my-org-attach-expand-link (file)
  (cond
   ((string-prefix-p (expand-file-name "~/dev/github/b") (expand-file-name (org-attach-expand "")))
    (concat "http://dsouza.bitforest.org/static" (my-delete-prefix (org-attach-expand "") (org-attach-expand file))))
   (t
    (org-attach-expand-link file))
   ))

(defun my-org-publish-before-export-hook ()
  (setq org-link-abbrev-alist-backup org-link-abbrev-alist)
  (setq org-link-abbrev-alist '(("attach" . my-org-attach-expand-link))))

(defun my-org-publish-after-export-hook ()
  (setq org-link-abbrev-alist org-link-abbrev-alist-backup))

(defun my-org-insert-link-to-attachment (&optional name)
  (interactive "P")
  (cond 
   (name 
    (org-insert-link 'org-store-link (concat "attach:" (org-attach-expand name))))
   (t 
    (let ((myname (read-string "Attachment: ")))
      (org-insert-link 'org-store-link (concat "attach:" (org-attach-expand myname)))))))

(defun my-org-mode-hook ()
  (define-key org-mode-map (kbd "C-k") 'my-org-kill-whole-line)
  (define-key org-mode-map (kbd "C-c a") 'org-agenda)
  (define-key org-mode-map (kbd "C-c M-l") 'my-org-insert-link-to-attachment)
  (define-key icicle-mode-map (kbd "C-c /") nil)
  (setq org-enforce-todo-dependencies t)
  (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
  (setq org-publish-project-alist
        '(

          ("dsouza-org"
           :base-directory "~/dev/github/b/org"
           :base-extension "org"
           
           :recursive t
           :body-only t
           :auto-preamble nil
           :html-extension "html"
           :publishing-function org-publish-org-to-html
           :publishing-directory "~/dev/github/b/_posts"
           )

          ("dsouza-static"
           :base-directory "~/dev/github/b/org"
           :base-extension "css\\|js\\|png\\|jpg\\|gif"

           :recursive t
           :publishing-function org-publish-attachment
           :publishing-directory "~/dev/github/b/static"
           )

          ("dsouza" :components ("dsouza-org" "dsouza-static")))))

;; source: http://www.emacswiki.org/emacs/RecursiveEditPreservingWindowConfig
(defmacro my-recursive-edit-preserving-window-config (body)
  "*Return a command that enters a recursive edit after executing BODY.
    Upon exiting the recursive edit (with\\[exit-recursive-edit] (exit)
    or \\[abort-recursive-edit] (abort)), restore window configuration
    in current frame.
  "
  `(lambda ()
     "See the documentation for `recursive-edit-preserving-window-config'."
     (interactive)
     (save-window-excursion
       ,body
       (recursive-edit))))

(defun my-recursive-edit-without-this-window ()
  "Enters recursive edit without this window. When exiting edit
   restores window configuration
  "
  (let ((myf (command-remapping 'delete-window)))
    (if (commandp 'myf)
        (myf)
      (delete-window))))

;; source: http://www.emacswiki.org/emacs/RecursiveEditPreservingWindowConfig
(defun my-recursive-edit-with-single-window ()
  "Enters recursive edit leaving only a single window. When
   exiting all other windows are restored.
  "
  (let ((myf (command-remapping 'delete-other-windows)))
       (if (one-window-p 'ignore-minibuffer)
           (error "current window is the only window in its frame")
         (if (commandp 'myf)
             (myf)
           (delete-other-windows)))))

(defun my-browse-url-chrome (url &rest ignore)
  "Browse url using google-chrome"
  (interactive "sURL: ")
  (shell-command-to-string (concat "google-chrome " (shell-quote-argument url) "&")))

(defun my-jump-and-visit-link ()
  (interactive)
  (let ((active w3m-link-numbering-mode))
    (when (not active) (w3m-link-numbering-mode))
    (w3m-move-numbered-anchor (read-number "Link #: "))
    (w3m-view-url-with-external-browser)))

; (defun my-jump-and-yank-link ()
;   (interactive)
;   (let ((active w3m-link-numbering-mode))
;     (when (not active) (w3m-link-numbering-mode))
;     (w3m-move-numbered-anchor (read-number "Link #: "))
;     (w3m-url-at-point)))

(provide 'myemacs)
