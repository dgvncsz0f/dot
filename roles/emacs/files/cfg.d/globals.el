(require 'tramp)
(require 'uniquify)
(require 'midnight)

;; editing
(setq kill-whole-line t)
(setq blink-matching-paren t)
(setq comment-multi-line t)
(setq-default indent-tabs-mode nil)
(delete-selection-mode t)
(size-indication-mode t)
(column-number-mode t)
(global-font-lock-mode t)
(global-visual-line-mode t)
(transient-mark-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; uniquify
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix nil)

;; display-line-numbers
(setq display-line-numbers-type 'relative)

;; dired
(setq dired-hide-details-hide-symlink-targets nil)

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; tramp/password
(setq password-cache t)
(setq password-cache-expiry (* 8 3600))
(setq
 tramp-password-prompt-regexp
 (concat
  "^.*"
  (regexp-opt
   '("passphrase" "Passphrase"
     "password" "Password"
     "Verification code" "verification code") t)
  ".*:\0? *"))
(add-to-list 'tramp-default-proxies-alist '("\\." "root" "/ssh:dsouza@%h:"))
(add-to-list 'tramp-default-proxies-alist '("localhost" "root" nil))
(add-to-list 'tramp-default-proxies-alist '(".*\\.localdomain" "root" nil))

;; disable limiters
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; x11/graphics
(menu-bar-mode 0)
(tool-bar-mode 0)
(set-scroll-bar-mode nil)

;; other stuff
(midnight-delay-set 'midnight-delay 0)
(fset 'yes-or-no-p 'y-or-n-p)

(setq enable-remote-dir-locals t)
(setq echo-keystrokes 0.1)
(setq backup-inhibited t)
(setq tags-revert-without-query t)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(setq mail-from-style 'angles)
(setq ffap-machine-p-known 'reject)
