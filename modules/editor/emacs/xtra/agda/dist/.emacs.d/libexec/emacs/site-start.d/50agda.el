(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(require 'agda2)
(require 'agda2-highlight)

(agda2-highlight-set-faces 'agda2-highlight-face-groups 'default-faces)
(setq-default agda2-highlight-level 'interactive)
