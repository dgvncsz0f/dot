; http://irreal.org/blog/?p=297

(require 'projectile)
(require 'icicles-mac)

(defun dgvncsz0f--cider-test-run-tests ()
  (interactive)
  (let ((testns (concat (clojure-find-ns) "-test")))
    (-if-let (path (cider-sync-request:ns-path testns))
        (progn
          (cider-load-file path)
          (call-interactively 'cider-test-run-tests))
      (error "can't find ns %s" testns))))

(defun dgvncsz0f-invoke-compile (compile-command)
  (let ((default-directory (concat (dgvncsz0f-project-root) "/" dgvncsz0f-compile-root)))
    (recompile)))

(defun dgvncsz0f-compile-test ()
  (interactive)
  (when (boundp 'dgvncsz0f-compile-test-command)
    (dgvncsz0f-invoke-compile dgvncsz0f-compile-test-command)))

(defun dgvncsz0f-recompile ()
  (interactive)
  (when (boundp 'dgvncsz0f-compile-command)
    (dgvncsz0f-compile dgvncsz0f-compile-command)))

(defun dgvncsz0f-compile-clean ()
  (interactive)
  (when (boundp 'dgvncsz0f-compile-clean-command)
    (dgvncsz0f-compile dgvncsz0f-compile-clean-command)))

(defun dgvncsz0f-eval-and-replace (value)
  "Evaluate the sexp at point and replace it with its value"
  (interactive (list (eval-last-sexp nil)))
  (kill-sexp -1)
  (insert (format "%S" value)))

(defun dgvncsz0f-prepend-line (&optional arg)
  " Insert a newline before the current one. C-a C-o achieves the
    same result.
  "
  (interactive "P")
  (move-beginning-of-line arg)
  (open-line 1))

(defun dgvncsz0f-append-line (&optional arg)
  " Insert a newline after the current one. C-e C-o achieves the
    same result.
  "
  (interactive "P")
  (move-end-of-line arg)
  (open-line 1)
  (forward-line 1))

(defun dgvncsz0f-locate-file (&optional arg)
  (interactive "P")
  (when (not (symbol-value 'projectile-mode))
    (projectile-mode t))
  (projectile-maybe-invalidate-cache arg)
  (call-interactively 'icicle-projectile-find-file "P" arg))

(icicle-define-command
 icicle-projectile-find-file
 "Jump to a project's file using completion. With a prefix ARG invalidates the cache first."
 (lambda (x)
   (find-file x)
   (run-hooks 'projectile-find-file-hook))
 "File: "
 (mapcar (lambda (x) (projectile-expand-root x)) (projectile-current-project-files)))

(defun dgvncsz0f-locate-dir (&optional arg)
  (interactive "P")
  (when (not (symbol-value 'projectile-mode))
    (projectile-mode t))
  (projectile-maybe-invalidate-cache arg)
  (call-interactively 'icicle-projectile-find-dir "P" arg))

(icicle-define-command
 icicle-projectile-find-dir
 "Jump to a project's file using completion. With a prefix ARG invalidates the cache first."
 (lambda (x)
   (find-file x)
   (run-hooks 'projectile-find-dir-hook))
 "File: "
 (map 'list 'projectile-expand-root (projectile-current-project-dirs)))

(defun dgvncsz0f-toggle-flyspell ()
  " Toggles flyspell-mode.
  "
  (interactive)
  (if (symbol-value 'flyspell-mode)
      (flyspell-mode (- 1))
    (flyspell-mode)
    (flyspell-buffer)))

(defun dgvncsz0f-irc-freenode ()
  (interactive)
  (if (boundp 'nickserv-passwd)
      (erc-tls :server "irc.freenode.net" :port 6697 :nick "dgvncsz0f" :full-name "dsouza" :password nickserv-passwd)))

(defun dgvncsz0f-irc-bitlbee ()
  (interactive)
  (if (boundp 'nickserv-passwd)
      (erc :server "localhost" :port 6667 :nick "dgvncsz0f" :full-name "dsouza" :password nickserv-passwd)))

(defun dgvncsz0f-irc-oftc ()
  (interactive)
  (if (boundp 'nickserv-passwd)
      (erc-tls :server "irc.oftc.net" :port 6697 :nick "dgvncsz0f" :full-name "dsouza" :password nickserv-passwd)))

(defun dgvncsz0f-irc-slack ()
  (interactive)
  (if (boundp 'slack-password)
      (erc-tls :server "locaweb.irc.slack.com" :port 6667 :nick "dgvncsz0f" :full-name "dgvncsz0f" :password slack-password)))

(defun dgvncsz0f-zprint-this ()
  (interactive)
  (basic-save-buffer)
  (shell-command (concat "lein zprint " buffer-file-name)))

(defun dgvncsz0f-irc-connect-all ()
  (interactive)
  (dgvncsz0f-irc-slack)
  (dgvncsz0f-irc-freenode)
  (dgvncsz0f-irc-oftc)
  (dgvncsz0f-irc-bitlbee))

(defun dgvncsz0f-irc-disconnect-all ()
  (interactive)
  (save-excursion
    (map nil '(lambda (s)
                (when (get-buffer s)
                  (message s)
                  (set-buffer s)
                  (erc-cmd-QUIT nil))) '("localhost:6667" "irc.freenode.net:6667" "locaweb.irc.slack.com:6667" "irc.oftc.net:6667"))))

(provide 'dgvncsz0f)
