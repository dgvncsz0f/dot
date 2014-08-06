(unless (package-installed-p 'undo-tree)
  (package-refresh-contents)
  (package-install 'undo-tree))

(require 'undo-tree)
(global-undo-tree-mode)
