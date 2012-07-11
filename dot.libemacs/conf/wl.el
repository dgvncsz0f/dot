;; mode:-*-emacs-lisp-*-

;; Mostly stuff stolen from: http://www.emacswiki.org/emacs/hgw-init-wl.el

(require 'wl)
(require 'wl-draft)
(require 'w3m-load)
(require 'mime-w3m)
(require 'bbdb-wl)

(setq 
  ;; Misc
  wl-message-window-size '(2 . 3)
  wl-insert-message-id nil
  wl-mime-charset 'x-ctext
  elmo-mime-charset 'utf-8
  mime-transfer-level 8
  browse-url-browser-function 'my-browse-url-chrome
  wl-interactive-send t
  wl-interactive-exit nil
  wl-draft-always-delete-myself t
  wl-user-mail-address-list '("dgvncsz0f@bitforest.org" "dgvncsz0f@gmail.com" "paravinicius@yahoo.com.br" "diego.souza@locaweb.com.br")

  ;; Automatic signature insertion
  signature-file-name "~/.email-signature.txt"
  signature-insert-at-eof t
  signature-delete-blank-lines-at-eof t

  ;; Notification
  ;; Set mail-icon to be shown universally in the modeline.
  ;; global-mode-string
  ;; (cons
  ;;  '(wl-modeline-biff-status
  ;;    wl-modeline-biff-state-on
  ;;    wl-modeline-biff-state-off)
  ;;  global-mode-string)
  ;; wl-biff-check-folder-list
  ;; '( "%inbox:\"dgvncsz0f@bitforest.org\"/clear@imap.gmail.com:993!"
  ;;    "%inbox:\"diego.souza\"/clear@outlook.locaweb.com.br:993!"
  ;;   )
  ;; wl-biff-check-interval 180
  ;; wl-biff-use-idle-timer t
  wl-strict-diff-folders '("^%inbox.*")
  wl-folder-use-server-diff t

  ;; Mail/Imap
  elmo-maildir-folder-path "~/Maildir"
  elmo-imap4-default-authenticate-type 'clear
  elmo-imap4-default-port '993
  elmo-imap4-default-stream-type 'ssl
  elmo-imap4-set-seen-flag-explicitly t
  elmo-network-session-idle-timeout 60
  elmo-imap4-debug t

  ;; SMTP
  wl-smtp-connection-type 'starttls
  wl-smtp-posting-port 25
  wl-smtp-authenticate-type "plain"
  wl-smtp-posting-user "dgvncsz0f"
  wl-smtp-posting-server "localhost"

  ;; Summary
  wl-auto-select-next 'unread
  wl-summary-width nil
  wl-summary-weekday-name-lang "en"
  wl-summary-line-format "%T%P%M/%D(%W)%h:%m %[ %17f %] %t%C%s"
  wl-thread-insert-opened t
  wl-thread-open-reading-thread t

  ;; Folder
  wl-folder-window-width 25
  wl-stay-folder-window t
  wl-folder-check-async t
  wl-auto-check-folder-name nil
  wl-auto-check-folder-list nil
  wl-auto-uncheck-folder-list '("^.*")
  wl-highlight-folder-by-numbers 1

  ;; Mime
  wl-fcc-force-as-read t
  mime-edit-split-message nil
  mime-w3m-display-inline-images t
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
  wl-draft-reply-buffer-style 'full
  wl-dispose-folder-alist
  '(
    (".*gmail" . "%[Gmail]/Trash:\"dgvncsz0f@bitforest.org\"/clear@imap.gmail.com:993!")
    (".*locaweb" . remove)
    )
  wl-template-default-name "gmail"
  wl-template-alist
  '(
    ("gmail"
     (wl-from . "diego souza <dgvncsz0f@bitforest.org>")
     ("From" . wl-from)
     (wl-fcc . nil)
     (wl-trash-folder . "%[Gmail]/Trash:\"dgvncsz0f@bitforest.org\"/clear@imap.gmail.com:993!")
     ; (wl-draft-folder . "%[Gmail]/Drafts:\"dgvncsz0f@bitforest.org\"/clear@imap.gmail.com:993!")
     (wl-smtp-connection-type . 'starttls)
     (wl-smtp-posting-port . 25)
     (wl-smtp-authenticate-type . "plain")
     (wl-smtp-posting-user . "dgvncsz0f@bitforest.org")
     (wl-smtp-posting-server . "smtp.gmail.com")
     (signature-file-name . "~/.email-signature.txt")
     )
    ("locaweb"
     (wl-from . "diego souza <diego.souza@locaweb.com.br>")
     ("From" . wl-from)
     ("Fcc" . "%sent items:\"diego.souza\"/clear@outlook.locaweb.com.br:993!")
     (wl-smtp-connection-type . 'starttls)
     (wl-smtp-posting-port . 587)
     (wl-smtp-authenticate-type . "login")
     (wl-smtp-posting-user . "diego.souza")
     (wl-smtp-posting-server . "outlook.locaweb.com.br")
     (signature-file-name . "~/.email-signature.txt")
     )
    )
  wl-draft-config-alist
  '(
    ((string-match "locaweb" wl-draft-parent-folder)
     (template . "locaweb")
     )
    ((string-match "." wl-draft-parent-folder)
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

(define-key wl-template-mode-map (kbd "C-n") 'wl-template-next)
(define-key wl-template-mode-map (kbd "C-p") 'wl-template-prev)
(define-key wl-template-mode-map (kbd "C-c C-c") 'wl-template-set)

;; ----------------------------------------------------------------------------
;;; Configure BBDB to manage Email addresses
(bbdb-wl-setup)

(setq bbdb-use-pop-up t ;; Allow pop-ups
      bbdb-pop-up-target-lines 2
      bbdb/mail-auto-create-p t ;; auto collection
      bbdb-wl-ignore-folder-regexp "^@" ;; folders without auto collection
      bbdb-north-american-phone-numbers-p nil
      bbdb-auto-notes-alist '(("X-ML-Name" (".*$" ML 0)))
      bbdb-dwim-net-address-allow-redundancy t
      bbdb-offer-save 'never
      bbdb-quiet-about-name-mismatches t

      ;; shows the name of bbdb in the summary

      ;; Not with wl-summary-showto-folder-regexp
      ;;wl-summary-from-function 'bbdb-wl-from-func
      ;; Use the default:
      wl-summary-from-function 'wl-summary-default-from

      wl-summary-get-petname-function '(lambda (string) (or (wl-address-header-extract-realname string) (wl-address-header-extract-address string)))
      )

;; Apply wl-draft-config-alist as soon as you enter in a draft buffer. Without
;; this wanderlust would apply it only when actually sending the e-mail.
(add-hook 'wl-mail-setup-hook 'wl-draft-config-exec)

; (add-hook 'mime-view-mode-hook
; 	  (lambda ()
; 	    (local-set-key "f" 'my-jump-and-visit-link)
;             (w3m-link-numbering-mode)))

(add-hook
 'wl-summary-exec-hook
 '(lambda ()
    ;; Synchronise the folder with the server after executing the summary
    ;; operation
    (wl-summary-sync-update)
    ))

;; (add-hook
;;  'wl-biff-notify-hook
;;  '(lambda ()
;;     (my-wl-update-current-summaries)
;;     ))

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

     ;; elmo-imap4-set-seen-flag-explicitly doesn't seem to work
     ;; little hack for now
     ;; (defadvice wl-biff-check-folder (after my-wl-biff-check-folder (folder))
     ;;   "This function ignores NEW messages and uses UNREAD instead"
     ;;   (let ((new (nth 1 ad-return-value))
     ;;         (tail (cdr ad-return-value)))
     ;;     (setq ad-return-value (cons new tail))))
     ;; (ad-activate 'wl-biff-check-folder)
     ))


(defun wl-draft-config-sub-signature (content)
   "Insert the signature at the end of the MIME message."
   (let ((signature-insert-at-eof nil)
         (signature-file-name content))
     (goto-char (mime-edit-content-end))
     (insert-signature)))

(defun my-wl-update-current-summaries ()
  (let ((buffers (wl-collect-summary)))
    (while buffers
      (with-current-buffer (car buffers)
        (save-excursion
          (wl-summary-sync-update)))
      (setq buffers (cdr buffers)))))

