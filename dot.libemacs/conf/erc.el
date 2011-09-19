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
(setq erc-track-priority-faces-only 'all)
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/.irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)
(setq erc-max-buffer-size 20000)
(setq erc-truncate-buffer-on-save t)
(setq erc-email-userid "dsouza@bitforest.org")
(setq erc-prompt-for-nickserv-password nil)
(setq erc-timestamp-format "[%R-%m/%d]")
(setq erc-autojoin-channels-alist
          '(("freenode" "#haskell" "#agda" "#latex" "#emacs" "##devel-pedreiro" "#guru-sp")
            ("locaweb" "#cloud" "#infradev")))

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

(defun my-erc (arg port)
  (erc :server arg :port port :nick "dsouza")
  )

(defun my-irc-freenode()
  (interactive)
  (my-erc "irc.freenode.net" 6667)
  )

(defun my-irc-bitlbee()
  (interactive)
  (my-erc "localhost" 6667)
  )

(defun my-irc-locaweb()
   (interactive)
   (my-erc "irc.linux.locaweb.com.br" 5552)
   )

