(setq erc-track-enable-keybindings nil)

(require 'erc)
(require 'erc-join)
(require 'erc-match)
(require 'erc-track)
(require 'erc-fill)
(require 'erc-ring)
(require 'erc-netsplit)

(load "~/.erc.passwd")

;; References: http://www.emacswiki.org/emacs/ErcStartupFiles
;;             http://www.emacswiki.org/emacs/ErcChannelTracking
(setq erc-current-nick-highlight-type 'nick)
(setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE"))
(setq erc-track-use-faces t)
(setq erc-track-faces-priority-list
      '(erc-current-nick-face erc-keyword-face))
(setq erc-user-full-name nil)
(setq erc-email-userid nil)
(setq erc-track-priority-faces-only 'all)
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/.irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-max-buffer-size 20000)
(setq erc-truncate-buffer-on-save t)
(setq erc-prompt-for-nickserv-password nil)
(setq erc-timestamp-format "[%R-%m/%d]")
(setq erc-auto-query 'bury)
(setq erc-query-display 'buffer)
(setq erc-kill-buffer-on-part t)
(setq erc-kill-queries-on-quit t)
(setq erc-kill-server-buffer-on-quit t)
(setq erc-autojoin-channels-alist
          '(("freenode" "#haskell" "#agda" "#latex" "#emacs" "##devel-pedreiro" "#guru-sp")
            ("locaweb" "#cloud" "#infradev")))

(defadvice erc-auto-query (around erc-auto-query-dirtyfix activate)
  (let ((old-erc-query-display erc-query-display))
    (setq erc-query-display erc-auto-query)
    ad-do-it
    (setq erc-query-display old-erc-query-display)))

;; Source: http://www.emacswiki.org/emacs/ErcChannelTracking#toc5
(defadvice erc-track-find-face (around erc-track-find-face-promote-query activate)
  (if (erc-query-buffer-p) 
      (setq ad-return-value (intern "erc-current-nick-face"))
    ad-do-it))

(defadvice erc-track-modified-channels (around erc-track-modified-channels-promote-query activate)
  (if (erc-query-buffer-p) (setq erc-track-priority-faces-only 'nil))
  ad-do-it
  (if (erc-query-buffer-p) (setq erc-track-priority-faces-only 'all)))

(add-hook 'erc-insert-post-hook 'erc-save-buffer-in-logs)
(add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
(add-hook 'erc-after-connect '(lambda (SERVER NICK)
                                (message server)
                                (erc-message "PRIVMSG" (concat "nickserv identify " nickserv-passwd))))

(erc-match-mode t)
(erc-autojoin-mode t)
(erc-track-mode t) 
(erc-fill-mode t)
(erc-ring-mode t)
(erc-netsplit-mode t)
(erc-timestamp-mode t)
(erc-button-mode (- 1))

(defun my-irc-freenode ()
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "dgvncsz0f" :full-name "Diego Souza")
  )

(defun my-irc-bitlbee ()
  (interactive)
  (erc :server "localhost" :port 6667 :nick "dgvncsz0f" :full-name "Diego Souza")
  )

(defun my-irc-locaweb ()
   (interactive)
   (erc :server "irc.linux.locaweb.com.br" :port 5222 :nick "dgvncsz0f" :full-name "Diego Souza")
   )

;; Source: http://mwolson.org/projects/emacs-config/erc-init.el
(defun erc-cmd-YOW (&rest ignore)
  "Display some pinhead wisdom into the current ERC buffer.  I'd
rather not see it messaged to me, just sent out."
  (let ((yow-msg (replace-regexp-in-string "\n" "" (yow nil nil))))
    (erc-send-message
     (concat "{Pinhead wisdom} "
             yow-msg))))

(defun my-irc-connect-all ()
  (interactive)
  (my-irc-locaweb)
  (my-irc-freenode)
  (my-irc-bitlbee))

(defun my-irc-disconnect-all ()
  (interactive)
  (save-excursion
    (map nil '(lambda (s)
                (when (get-buffer s)
                  (message s)
                  (set-buffer s)
                  (erc-cmd-QUIT nil))) '("localhost:6667" "irc.freenode.net:6667" "irc.linux.locaweb.com.br:5222"))))
