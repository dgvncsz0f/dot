; -*- mode: emacs-lisp -*-

(require 'url)

(defun dx15_emacswiki/filename (url)
  (concat dx15-libd "/" (file-name-nondirectory url)))

(defun dx15_emacswiki/installed-p (url)
  "checks if a given url is installed"
  (file-exists-p (dx15_emacswiki/filename url)))

(defun dx15_emacswiki/install (url)
  "install a given emacswiki file"
  (url-copy-file url (dx15_emacswiki/filename url) t))

(provide 'dx15_emacswiki)
