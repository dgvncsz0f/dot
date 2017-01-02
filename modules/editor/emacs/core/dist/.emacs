; -*- mode: emacs-lisp; -*-

(require 'custom)
(require 'server)
(require 'uniquify)
(require 'package)
(require 'midnight)

(when (>= emacs-major-version 24)
  (package-initialize)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (unless package--initialized
    (package-initialize t))
  (unless package-archive-contents
    (package-refresh-contents)))

(unless (boundp 'user-emacs-directory)
  (setq user-emacs-directory "~/.emacs.d/"))

(let ((user-site-lisp-dir (concat user-emacs-directory "share/emacs/site-lisp/"))
      (user-theme-dir (concat user-emacs-directory "themes/"))
      (user-site-start-dir (concat user-emacs-directory "libexec/emacs/site-start.d/")))
  (add-to-list 'custom-theme-load-path user-theme-dir)
  (let ((default-directory user-site-lisp-dir))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path))
  (mapcar 'load (file-expand-wildcards (concat user-site-start-dir "*.el"))))

(set-face-attribute 'default nil :height 160)
(set-frame-font "Iosevka Term:weight=Light" nil t)

(fset 'yes-or-no-p 'y-or-n-p)

(midnight-delay-set 'midnight-delay 0)
(setq magit-last-seen-setup-instructions "1.4.0")
(setq enable-remote-dir-locals t)
(setq echo-keystrokes 0.1)
(setq vc-mode t)
(setq ssl-program-name "gnutls-cli")
(setq ssl-program-arguments '("--insecure" "--port" service "--x509cafile" "/etc/ssl/certs/ca-certificates.crt" host))
(setq-default indent-tabs-mode nil)
(setq backup-inhibited t)
(setq tags-revert-without-query t)
(setq auto-save-default nil)
(setq blink-matching-paren t)
(setq inhibit-startup-screen t)
(setq modeline-shadow-thickness 0)
(setq comment-multi-line t)
(setq mail-from-style 'angles)
(setq kill-whole-line t)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix nil)
(setq custom-file "~/.emacs.d/custom-file")
(setq dired-hide-details-hide-symlink-targets nil)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq
 tramp-password-prompt-regexp
 (concat
  "^.*"
  (regexp-opt
   '("passphrase" "Passphrase"
     "password" "Password"
     "Verification code" "verification code") t)
  ".*:\0? *"))
(add-to-list 'tramp-default-proxies-alist '(nil "root" "/ssh:dsouza@%h:"))
(add-to-list 'tramp-default-proxies-alist '("localhost" nil nil))

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(unless (package-installed-p 'darktooth-theme)
  (package-install 'darktooth-theme))

(menu-bar-mode 0)
(tool-bar-mode 0)
(set-scroll-bar-mode nil)
(load-theme 'darktooth t)
(darktooth-modeline)

(when (file-exists-p custom-file) (load custom-file))

(delete-selection-mode t)
(show-paren-mode t)
(size-indication-mode t)
(column-number-mode t)
(global-font-lock-mode t)
(global-linum-mode t)
(global-visual-line-mode t)
(global-subword-mode t)
(transient-mark-mode t)
(linum-relative-global-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq password-cache t
      password-cache-expiry (* 8 3600))

(setq eshell-aliases-file "~/.emacs.d/eshell.aliases"
      eshell-history-size 9999)

(defun eshell/gst (&rest args)
  (magit-status (car args))
  (eshell/echo))

(defun eshell/j (&rest args)
  (bookmark-maybe-load-default-file)
  (let ((path (bookmark-get-filename (car args))))
    (if (file-directory-p path)
        (eshell/cd path)
      (bookmark-jump name))))

(unless (server-running-p) (server-start))
