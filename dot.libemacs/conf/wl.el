;; mode:-*-emacs-lisp-*-

;; This is mostly stuff I found online

(require 'wl)
(require 'wl-draft)

(setq 
  elmo-maildir-folder-path "~/Maildir"          ;; where i store my mail

  wl-stay-folder-window t                       ;; show the folder pane (left)
  wl-folder-window-width 25                     ;; toggle on/off with 'i'
  
  wl-message-window-size '(2 . 3)

  ;; gmail not reporting new mails
  elmo-imap4-set-seen-flag-explicitly t

  ;; Automatic signature insertion
  signature-file-name "~/.email-signature.txt"
  signature-insert-at-eof t

  ;; mark sent messages as read
  wl-fcc-force-as-read t

  ;; Biff notification
  wl-biff-check-folder-list
  '("%inbox:\"dsouza@bitforest.org\"/clear@imap.gmail.com:993!"
    "%inbox:\"diego.souza@locaweb.com.br\"/clear@webmail.locaweb.com.br:993!"
    )
  wl-biff-check-interval 180
  wl-biff-use-idle-timer t

  ;; SMTP
  wl-smtp-connection-type 'starttls
  wl-smtp-posting-port 587
  wl-smtp-authenticate-type "plain"

  ;; summary
  wl-auto-select-next 'unread
  wl-summary-width nil
  wl-summary-weekday-name-lang "en"
  wl-summary-line-format "%T%P%M/%D(%W)%h:%m %[ %17f %][%n/%S] %t%C%s"
  
  ;; Summary threads
  wl-thread-insert-opened t
  wl-thread-open-reading-thread t

  ;; IMAP
  elmo-imap4-default-authenticate-type 'clear
  elmo-imap4-default-port '993
  elmo-imap4-default-stream-type 'ssl

  ;; hide many fields from message buffers
  wl-message-ignored-field-list '("^.*:")
  wl-message-visible-field-list
  '("^\\(To\\|Cc\\):"
    "^Subject:"
    "^\\(From\\|Reply-To\\):"
    "^Organization:"
    "^Message-Id:"
    "^\\(Posted\\|Date\\):"
    )
  wl-message-sort-field-list
  '("^From"
    "^Organization:"
    "^X-Attribution:"
     "^Subject"
     "^Date"
     "^To"
     "^Cc")

  wl-dispose-folder-alist
  '(
    (".*gmail" . "%[Gmail]/Trash")
    (".*locaweb" . remove)
    )

  wl-template-alist
  '(
    ("gmail"                            ; Gmail
     (wl-from . "Diego Souza <dsouza@bitforest.org>")
     (wl-trash-folder . "%[Gmail]/Trash")
     (wl-draft-folder . "%[Gmail]/Drafts")
     (wl-fcc . nil)
     ("From" . wl-from)
     (wl-smtp-connection-type . 'starttls)
     (wl-smtp-posting-port . 587)
     (wl-smtp-authenticate-type . "plain")
     (wl-smtp-posting-user . "diego.souza@bitforest.org")
     (wl-smtp-posting-server . "smtp.gmail.com")
     (wl-local-domain . "bitforest.org")
     (signature-file-name . "~/.email-signature.txt")
     )
    ("locaweb"
     (wl-from . "Diego Souza <diego.souza@locaweb.com.br>")
     ("From" . wl-from)
     (wl-smtp-connection-type . 'starttls)
     (wl-smtp-posting-port . 25)
     (wl-smtp-authenticate-type . "plain")
     (wl-smtp-posting-user . "diego.souza@locaweb.com.br")
     (wl-smtp-posting-server . "webmail.locaweb.com.br")
     (wl-local-domain . "locaweb.com.br")
     (signature-file-name . "~/.email-signature.txt")
     )
    )

  ; Do not split large messages
  mime-edit-split-message nil

  ; let the SMTP servers handle the message-id and stop warning from wanderlust
  wl-insert-message-id nil

  ;; use "Fwd: " not "Forward: "
  wl-forward-subject-prefix "Fwd: "

  ;; Setting as "t" means that wanderlust should use a new frame for the draft
  ; wl-draft-use-frame t

  ;; Automatically select the correct template based on which folder I'm visiting
  wl-draft-config-matchone t
  wl-draft-config-alist
  '(
    ((and (string-match ".*locaweb" wl-draft-parent-folder))
     (template . "locaweb")
     )
    ((not (string-match ".*gmail" wl-draft-parent-folder))
     (template . "gmail")
     )
    )

  ;; Set mail-icon to be shown universally in the modeline.
  global-mode-string
  (cons
   '(wl-modeline-biff-status
     wl-modeline-biff-state-on
     wl-modeline-biff-state-off)
   global-mode-string)
)

(if (boundp 'mail-user-agent)
      (setq mail-user-agent 'wl-user-agent))
  (if (fboundp 'define-mail-user-agent)
      (define-mail-user-agent
        'wl-user-agent
        'wl-user-agent-compose
        'wl-draft-send
        'wl-draft-kill
        'mail-send-hook))

;; Apply wl-draft-config-alist as soon as you enter in a draft buffer. Without
;; this wanderlust would apply it only when actually sending the e-mail.
(add-hook 'wl-mail-setup-hook 'wl-draft-config-exec)

(add-hook
 'wl-biff-notify-hook
 '(lambda ()
    (my-wl-update-current-summaries)
    ))

(add-hook
 'wl-init-hook
 '(lambda ()
    (defun elmo-read-passwd (prompt &optional stars)
      "Redefining this as the default does not allow paste and other useful things"
      (read-passwd prompt nil))
    ))

