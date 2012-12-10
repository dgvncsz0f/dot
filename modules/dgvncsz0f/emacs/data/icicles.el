(require 'icicles)

(defun my-locate-project-file ()
  (interactive)
  (if current-prefix-arg
      (icicle-locate-file)
    (let ((default-directory (or (my-locate-gitroot) default-directory)))
      (icicle-locate-file))))

(defun my-icicle-mode-hook ()
  (when icicle-mode
    (setq icicle-incremental-completion-flag t)
    (define-key icicle-mode-map (kbd "C-c f") 'my-locate-project-file)
    (define-key icicle-mode-map (kbd "C-c ,") 'icicle-tag-search)
    (setq icicle-apropos-complete-match-fn 'icicle-scatter-match)))

(add-hook 'icicle-mode-hook 'my-icicle-mode-hook)
