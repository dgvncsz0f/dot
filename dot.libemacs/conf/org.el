(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (emacs-lisp . t)
   ))
(setq org-link-abbrev-alist '(("attach" . org-attach-expand-link)))
(setq org-default-notes-file "~/dev/github/priv/org/dsouza.org")
(setq org-capture-templates
      '(
        ("s" "SIMPLE TODO" entry (file+headline org-default-notes-file "INBOX")
         "*** TODO %?\n    %i\n")
        
        ("t" "TODO W/O LINK" entry (file+headline org-default-notes-file "INBOX")
         "*** TODO %? %^g\n    %i\n    %U\n")

        ("c" "TODO W/ LINK" entry (file+headline org-default-notes-file "INBOX")
         "*** TODO %? %^g\n    %i\n    %U\n    %F\n")
        ))
