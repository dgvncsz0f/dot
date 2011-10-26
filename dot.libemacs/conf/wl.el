;; mode:-*-emacs-lisp-*-

;; This is mostly stuff I found online

(require 'wl)
(require 'wl-draft)

(setq 
  elmo-maildir-folder-path "~/Maildir"          ;; where i store my mail

  wl-stay-folder-window t                       ;; show the folder pane (left)
  wl-folder-window-width 25                     ;; toggle on/off with 'i'
  
  wl-smtp-posting-server "smtp.gmail.com"       ;; put the smtp server here
  wl-local-domain "bitforest.org"               ;; put something here...
  wl-message-id-domain "bitforest.org"          ;; ...

  wl-message-window-size '(2 . 3)

  wl-from "Diego Souza <dsouza@bitforest.org>"  ;; my From:

  ;; Automatic signature insertion
  signature-file-name "~/.email-signature"
  signature-insert-at-eof t

  wl-fcc-force-as-read t            ;; mark sent messages as read 

  ;; Biff notification
  ;; wl-biff-check-folder-list
  ;; '("%inbox:\"diego.souza@locaweb.com.br\"/clear@webmail.locaweb.com.br:993!"
  ;;   "%inbox:\"dsouza@bitforest.org\"/clear@imap.gmail.com:993!"
  ;;   )
  ;; wl-biff-check-interval 180
  ;; wl-biff-use-idle-timer t

  ;; SMTP
  wl-smtp-connection-type 'starttls
  wl-smtp-posting-port 587
  wl-smtp-authenticate-type "plain"
  wl-smtp-posting-user "dsouza@bitforest.org"
  wl-smtp-posting-server "smtp.gmail.com"
  wl-local-domain "bitforest.org"

  ;; IMAP
  elmo-imap4-default-server "imap.gmail.com"
  elmo-imap4-default-user "dsouza@bitforest.org"
  elmo-imap4-default-authenticate-type 'clear
  elmo-imap4-default-port '993
  elmo-imap4-default-stream-type 'ssl
  elmo-imap4-use-modified-utf7 t

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
     (signature-file-name . "~/.email-signature")
     )
    ("locaweb"
     (wl-from . "Diego Souza <diego.souza@locaweb.com.br>")
     ("From" . wl-from)
     (wl-smtp-connection-type . nil)
     (wl-smtp-posting-port . nil)
     (wl-smtp-authenticate-type . "login") ; change if necessary
     (wl-smtp-posting-user . "diego.souza@locaweb.com.br")
     (wl-smtp-posting-server . "webmail.locaweb.com.br")
     (wl-local-domain . "locaweb.com.br")
     ("Organization" . "Locaweb")
     (signature-file-name . "~/.email-signature")
     )
    )

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

;; the default function doesn't works for me
(defun elmo-read-passwd (prompt &optional stars)
    (read-passwd prompt nil))
