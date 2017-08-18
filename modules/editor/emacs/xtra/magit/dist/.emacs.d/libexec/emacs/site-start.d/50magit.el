(unless (package-installed-p 'magit)
  (package-install 'magit))

(setq vc-handled-backends nil)
(remove-hook 'server-switch-hook 'magit-commit-diff)
(remove-hook 'magit-refs-sections-hook 'magit-insert-tags)
