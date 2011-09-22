(require 'color-theme)
(require 'zenburn)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-zenburn)))

(set-face-background 'col-highlight zenburn-bg-1)
(set-face-attribute 'mode-line nil :box nil)
(set-default-font "DejaVu Sans Mono")
(set-face-attribute 'default nil :height 140)
