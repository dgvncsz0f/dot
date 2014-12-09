(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode))

(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-indentation)))
