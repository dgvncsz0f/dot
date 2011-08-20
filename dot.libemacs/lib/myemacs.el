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

(provide 'myemacs)
