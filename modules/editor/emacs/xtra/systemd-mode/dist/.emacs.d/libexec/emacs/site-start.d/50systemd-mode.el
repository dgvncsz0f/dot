; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'systemd)
  (package-install 'systemd))
