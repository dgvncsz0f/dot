(unless (package-installed-p 'haskell-mode)
  (package-refresh-contents)
  (package-install 'haskell-mode))

(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-simple-indent)))
