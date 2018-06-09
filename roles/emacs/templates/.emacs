; -*- mode: emacs-lisp; -*-

(require 'custom)
(require 'server)

(setq dx15-root "{{ root }}/.emacs.d/dx15")
(setq dx15-libd "{{ root }}/.emacs.d/dx15/lib.d")
(setq dx15-exed "{{ root }}/.emacs.d/dx15/exe.d")
(setq dx15-files "{{ root }}/.emacs.d/dx15/files")
(setq user-emacs-directory "{{ root }}/.emacs.d/")
(setq custom-file "{{ root }}/.emacs.d/custom-file")

(normal-top-level-add-to-load-path (list dx15-libd))
(mapc 'load (file-expand-wildcards (concat dx15-exed "/*.el")))

(when (file-exists-p custom-file) (load custom-file))

(unless (server-running-p) (server-start))
