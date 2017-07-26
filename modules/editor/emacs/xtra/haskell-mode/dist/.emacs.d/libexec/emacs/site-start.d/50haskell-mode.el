(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode))

(unless (package-installed-p 'intero)
  (package-install 'intero))

(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-indentation)))
(add-hook 'haskell-mode-hook 'intero-mode)
