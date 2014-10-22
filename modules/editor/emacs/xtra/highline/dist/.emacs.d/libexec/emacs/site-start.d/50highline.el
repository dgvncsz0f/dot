(unless (package-installed-p 'highline)
  (package-refresh-contents)
  (package-install 'highline))
