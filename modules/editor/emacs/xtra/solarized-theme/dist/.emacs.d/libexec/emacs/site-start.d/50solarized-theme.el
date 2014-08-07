(unless (package-installed-p 'color-theme-solarized)
  (package-refresh-contents)
  (package-install 'color-theme-solarized))
