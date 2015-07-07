; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'icicles)
  (package-install 'icicles))

(require 'icicles)

(setq icicle-files-ido-like-flag t)
(setq icicle-buffers-ido-like-flag t)
(icicle-mode t)
