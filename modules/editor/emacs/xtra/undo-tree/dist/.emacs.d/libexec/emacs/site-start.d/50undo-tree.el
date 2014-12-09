(unless (package-installed-p 'undo-tree)
  (package-install 'undo-tree))

(require 'undo-tree)
(global-undo-tree-mode)
