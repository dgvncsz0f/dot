(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))
