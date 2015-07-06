; http://irreal.org/blog/?p=297
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

(defun dgvncsz0f-irc-connect-all ()
  (interactive)
  (my-irc-slack)
  (my-irc-freenode)
  (my-irc-oftc)
  (my-irc-bitlbee))

(defun dgvncsz0f-irc-disconnect-all ()
  (interactive)
  (save-excursion
    (map nil '(lambda (s)
                (when (get-buffer s)
                  (message s)
                  (set-buffer s)
                  (erc-cmd-QUIT nil))) '("localhost:6667" "irc.freenode.net:6667" "locaweb.irc.slack.com:6667" "irc.oftc.net:6667"))))

(provide 'dgvncsz0f)
