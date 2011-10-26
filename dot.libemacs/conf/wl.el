;; mode:-*-emacs-lisp-*-

;; This is mostly stuff I found online

(require 'wl)
(require 'wl-draft)

(setq 
  ;; Misc
  wl-message-window-size '(2 . 3)
  wl-insert-message-id nil
  wl-folder-window-width 25
  wl-stay-folder-window t

  ;; Automatic signature insertion
  signature-file-name "~/.email-signature.txt"
  signature-insert-at-eof t
  signature-delete-blank-lines-at-eof t

  ;; Notification
  ;; Set mail-icon to be shown universally in the modeline.
  global-mode-string
  (cons
   '(wl-modeline-biff-status
     wl-modeline-biff-state-on
     wl-modeline-biff-state-off)
   global-mode-string)
  wl-biff-check-folder-list
  '( "%inbox:\"dsouza@bitforest.org\"/clear@imap.gmail.com:993!"
     "%inbox:\"diego.souza@locaweb.com.br\"/clear@webmail.locaweb.com.br:993!"
    )
  wl-biff-check-interval 180
  wl-biff-use-idle-timer t

  ;; Mail/Imap
  elmo-maildir-folder-path "~/Maildir"
  elmo-imap4-set-seen-flag-explicitly t  ; gmail breaking imap
  elmo-imap4-default-authenticate-type 'clear
  elmo-imap4-default-port '993
  elmo-imap4-default-stream-type 'ssl

  ;; SMTP
  wl-smtp-connection-type 'starttls
  wl-smtp-posting-port 25
  wl-smtp-authenticate-type "plain"
  wl-smtp-posting-user "dsouza"
  wl-smtp-posting-server "localhost"

  ;; Summary
  wl-auto-select-next 'unread
  wl-summary-width nil
  wl-summary-weekday-name-lang "en"
  wl-summary-line-format "%11n %T%P%M/%D(%W)%h:%m %[ %17f %] %t%C%s"
  wl-thread-insert-opened t
  wl-thread-open-reading-thread t

  ;; Mime
  wl-fcc-force-as-read t
  mime-edit-split-message nil
  wl-forward-subject-prefix "Fwd: "
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

  ;; Accounts
  wl-draft-config-matchone t
  wl-dispose-folder-alist
  '(
    (".*gmail" . "%[Gmail]/Trash")
    (".*locaweb" . remove)
    )
  wl-template-alist
  '(
    ("gmail"
     (wl-from . "Diego Souza <dsouza@bitforest.org>")
     ("From" . wl-from)
     (wl-fcc . nil)
     (wl-trash-folder . "%[Gmail]/Trash")
     (wl-draft-folder . "%[Gmail]/Drafts")
     (wl-smtp-connection-type . 'starttls)
     (wl-smtp-posting-port . 587)
     (wl-smtp-authenticate-type . "plain")
     (wl-smtp-posting-user . "dsouza@bitforest.org")
     (wl-smtp-posting-server . "smtp.gmail.com")
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
     (signature-file-name . "~/.email-signature.txt")
     )
    )
  wl-draft-config-alist
  '(
    ((string-match ".*locaweb" wl-draft-parent-folder)
     (template . "locaweb")
     )
    ((string-match ".*gmail" wl-draft-parent-folder)
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

(add-hook
 'wl-mail-setup-hook
 '(lambda ()
    (setq wl-mime-charset 'utf-8
          elmo-mime-charset 'x-ctext
          )
    ))

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

     ;; Add support for (signature . "filename")
     (unless (assq 'signature wl-draft-config-sub-func-alist)
       (wl-append wl-draft-config-sub-func-alist
                  '((signature . wl-draft-config-sub-signature))))
 
     (defun mime-edit-insert-signature (&optional arg)
       "Redefine to insert a signature file directly, not as a tag."
       (interactive "P")
       (insert-signature arg))
    ))

(defun wl-draft-config-sub-signature (content)
   "Insert the signature at the end of the MIME message."
   (let ((signature-insert-at-eof nil)
         (signature-file-name content))
     (goto-char (mime-edit-content-end))
     (insert-signature)))
