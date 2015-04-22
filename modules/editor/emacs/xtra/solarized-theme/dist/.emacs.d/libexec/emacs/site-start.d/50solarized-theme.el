(unless (package-installed-p 'color-theme-solarized)
  (package-install 'color-theme-solarized))

(defun use-solarized-bgmode (frame mode)
  (set-frame-parameter frame 'background-mode mode)
  (when (not (display-graphic-p frame))
    (set-terminal-parameter (frame-terminal frame) 'background-mode mode))
  (enable-theme 'solarized))
