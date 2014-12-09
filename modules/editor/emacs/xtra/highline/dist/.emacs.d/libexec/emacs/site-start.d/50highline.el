(unless (package-installed-p 'highline)
  (package-install 'highline))

(set-variable 'highline-line t)
