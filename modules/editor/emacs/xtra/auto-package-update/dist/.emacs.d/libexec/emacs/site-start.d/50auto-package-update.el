; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'auto-package-update)
  (package-install 'auto-package-update))

(require 'auto-package-update)

(auto-package-update-at-time "03:00")
