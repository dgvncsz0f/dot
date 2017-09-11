(unless (package-installed-p 'magit)
  (package-install 'magit))

(setq vc-handled-backends nil)
(add-hook 'magit-mode-hook
          (lambda ()
            (remove-hook 'magit-refs-sections-hook 'magit-insert-tags)
            (remove-hook 'server-switch-hook 'magit-commit-diff)))
