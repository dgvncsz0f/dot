;;; icomplete+.el --- Extensions to `icomplete.el'.
;;
;; Filename: icomplete+.el
;; Description: Extensions to `icomplete.el'.
;; Author: Drew Adams
;; Maintainer: Drew Adams
;; Copyright (C) 1996-2012, Drew Adams, all rights reserved.
;; Created: Mon Oct 16 13:33:18 1995
;; Version: 21.0
;; Last-Updated: Mon Nov 19 11:41:04 2012 (-0800)
;;           By: dradams
;;     Update #: 1369
;; URL: http://www.emacswiki.org/cgi-bin/wiki/icomplete+.el
;; Doc URL: http://emacswiki.org/emacs/IcompleteMode
;; Keywords: help, abbrev, internal, extensions, local
;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x
;;
;; Features that might be required by this library:
;;
;;   `icomplete'.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;    Extensions to `icomplete.el'.
;;
;;  Faces defined here:
;;
;;    `icompletep-choices', `icompletep-determined',
;;    `icompletep-keys', `icompletep-nb-candidates'.
;;
;;  User option defined here:
;;
;;    `icompletep-include-menu-items-flag' (Emacs 23+),
;;    `icompletep-prospects-length' (Emacs < 23).
;;
;;  Macros defined here (but identical to those in Emacs 23):
;;
;;    `with-local-quit', `with-no-input'.
;;
;;  Non-interactive functions defined here:
;;
;;    `icompletep-remove-if'.
;;
;;
;;  ***** NOTE: The following functions defined in `icomplete.el'
;;              have been REDEFINED HERE:
;;
;;    `icomplete-get-keys' -
;;       1. Respect `icompletep-include-menu-items-flag'.
;;       2. Do not wrap with `<...>'.
;;       3. If string of keys would be too long then shorten it.
;;
;;    `icomplete-completions' -
;;       Prepends total number of candidates.
;;       Sorts alternatives alphabetically, uses different face.
;;       Highlights key-binding text.
;;       Appends number of remaining cycle candidates (for Icicles).
;;
;;    `icomplete-exhibit' -
;;       Saves match-data.
;;       Doesn't insert if input begins with `('
;;         (e.g. `repeat-complex-command').
;;       Ensures that the insertion doesn't deactivate mark.
;;
;;
;;  This file should be loaded after loading the standard GNU file
;;  `icomplete.el'.  So, in your `~/.emacs' file, do this:
;;  (eval-after-load "icomplete" '(progn (require 'icomplete+)))
;;
;;  Usage note: 
;;
;;    Starting with Emacs 23, you can get icompletion of things like
;;    file names also.  See option `icomplete-with-completion-tables'.
;;    I customize it to the (undocumented) value `t', which means that
;;    icompletion is available anytime the completion COLLECTION
;;    parameter is a function.  (This feature is not particular to
;;    Icomplete+ - it is true from vanilla Icomplete.)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;; 2012/11/19 dadams
;;     icomplete-completions:
;;       Exclude file names with extensions in completion-ignored-extensions.
;;       Use same MOST sexp as in Emacs <23 versions, since use try-completion.
;; 2012/08/06 dadams
;;     Removed old, commented code at end of file.
;; 2012/07/21 dadams
;;     icomplete-completions: Fixed typo for Emacs 23 version: COLLECTION everywhere, not CANDIDATES.
;; 2012/06/23 dadams
;;     icomplete-completions: Added new version for Emacs 24.  Remove 24 stuff from Emacs 23 version.
;;                            For Emacs 23 & 24: Use try-completion, not completion-try-completion.
;; 2012/06/16 dadams
;;     icomplete-completions (Emacs 23+):
;;       Use actual length of nb-cands-string, not min length from %7d format spec.
;;       Include length of icicle-completion-prompt-overlay, if Icicles and completing.
;; 2012/03/09 dadams
;;     icomplete-completions: Updated for Emacs 24: Bind non-essential and handle bug #10850.
;; 2011/10/13 dadams
;;     icomplete-get-keys: Added optional arg EXACTP.  Better spacing counts.
;;     icomplete-completions: Use MOST-TRY to determine exact match, pass to icomplete-get-keys.
;; 2011/10/12 dadams
;;     Added: icompletep-include-menu-items-flag, icomplete-get-keys, icompletep-remove-if.
;;     icomplete-completions: Truncate key-binding text if too long.
;; 2011/08/24 dadams
;;     Added top-level puts for common-lisp-indent-function.
;;     with-local-quit, while-no-input:
;;       Define only if not defined.  Use put for indentation.  Remove declare declaration.
;; 2011/06/05 dadams
;;     icomplete-completions: Handle Emacs 24's new METADATA arg for completion-try-completion.
;; 2011/01/04 dadams
;;     Removed autoload cookies from non def* sexps.  Added them for defgroup, defface.
;; 2010/07/29 dadams
;;     with-local-quit, with-no-input: Protect declare with fboundp.
;; 2009/08/06 dadams
;;     icomplete-completions (Emacs < 23): Bind, don't set, to initialize nb-candidates.
;; 2008/06/01 dadams
;;     icomplete-completions (Emacs 23): Set candidates to nil if ((nil)).
;;     Commented out vanilla Emacs code that's not used (last, base-size).
;; 2008/05/30 dadams
;;     Updated for Emacs 23 - complete rewrite.
;;       Added: macros with-local-quit and with-no-input.
;;       Added and adapted icomplete-exhibit and icomplete-completions for Emacs 23.
;;     icompletep-prospects-length: Use only for Emacs < 23.
;;     icomplete-exhibit: Removed vestigial test of icicle-apropos-completing-p.
;; 2006/07/30 dadams
;;     icomplete-exhibit: Save match-data.
;; 2006/07/16 dadams
;;     Added dark-background face suggestions from Le Wang - thx.
;; 2006/06/18 dadams
;;      icomplete-exhibit: Don't insert if Icicles apropos-completing.
;; 2006/01/07 dadams
;;      Added :link for sending bug report.
;; 2006/01/06 dadams
;;      Added defgroup.  Added :link.
;;      Renamed: prefix icomplete- to icompletep-.
;; 2005/12/18 dadams
;;     Renamed faces without "-face".
;;     Use defface.  Removed require of def-face-const.el.
;;     icomplete-prospects-length: defvar -> defcustom.
;; 2005/09/30 dadams
;;     Commented out redefinitions of primitives, so no longer reset
;;       minibuffer-completion-table to nil. Leaving the commented code in for now.
;; 2005/08/16 dadams
;;     icomplete-completions: If icicles.el is loaded, change no-match message slightly.
;; 2005/07/24 dadams
;;     icomplete-exhibit: Set deactivate-mark to nil at end.
;;     Remove commented Emacs 19 code at end.
;; 2005/07/19 dadams
;;     Added: icomplete-nb-candidates-face.
;;     icomplete-completions: Add number of icomplete candidates.
;;                            Append number of other cycle candidates (icicle).
;; 2005/05/29 dadams
;;     read-from-minibuffer: Updated to deal with new arg in Emacs 22.
;; 2004/12/02 dadams
;;     Highlight keys (icomplete-completions).
;; 2004/09/21 dadams
;;     Removed (icomplete-mode 99) at end.
;; 2004/04/13 dadams
;;     I'm not sure that some of the "enhancements" here are still
;;     needed.  This code was written long ago.  In particular, I'm not
;;     sure that the changes to `icomplete-exhibit' and the
;;     redefinitions of the Emacs primitives are needed.  Even if they
;;     are not needed, I'm leaving them in, as they are benign :).
;; 1995/12/15 dadams
;;     Defined replacements that reset minibuffer-completion-table to avoid
;;     icompletion: read-string, read-from-minibuffer, read-no-blanks-input.
;; 1995/11/30 dadams
;;     Added redefinition of yes-or-no-p.
;; 1995/10/17 dadams
;;     1) Added icomplete-choices-face and icomplete-determined-face.
;;     2) Redefined icomplete-exhibit: Doesn't insert if input
;;        begins with `('  (e.g. repeat-complex-command).
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'icomplete)

;; Quiet the byte-compiler.
(defvar icomplete-eoinput)
(defvar icomplete-with-completion-tables)
(defvar icompletep-include-menu-items-flag)
(defvar icompletep-prospects-length)
(defvar icicle-nb-of-other-cycle-candidates)

;;;;;;;;;;;;;;;;;;;

;;;###autoload
(defgroup Icomplete-Plus nil
  "Icomplete Enhancements."
  :prefix "icompletep-"
  :group 'completion :group 'convenience :group 'matching :group 'minibuffer
  :link `(url-link :tag "Send Bug Report"
          ,(concat "mailto:" "drew.adams" "@" "oracle" ".com?subject=\
icomplete+.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions."))
  :link '(url-link :tag "Other Libraries by Drew"
          "http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries")
  :link '(url-link :tag "Download"
          "http://www.emacswiki.org/cgi-bin/wiki/icomplete+.el")
  :link '(url-link :tag "Description"
          "http://www.emacswiki.org/cgi-bin/wiki/IcompleteMode#IcompleteModePlus")
  :link '(emacs-commentary-link :tag "Commentary" "icomplete+")
  )

;;;###autoload
(defface icompletep-choices
    '((((background dark)) (:foreground "Snow4"))
      (t (:foreground "DarkBlue")))
  "*Face for minibuffer reminder of possible completion suffixes."
  :group 'Icomplete-Plus)

;;;###autoload
(defface icompletep-determined
    '((t (:foreground "SeaGreen")))
  "*Face for minibuffer reminder of possible completion prefix."
  :group 'Icomplete-Plus)

;;;###autoload
(defface icompletep-nb-candidates
  '((((background dark)) (:foreground "SpringGreen"))
    (t (:foreground "DarkMagenta")))
  "*Face for minibuffer reminder of number of completion candidates.
This has no effect unless library `icicles.el' is being used."
  :group 'Icomplete-Plus)

;;;###autoload
(defface icompletep-keys
    '((t (:foreground "Red")))
  "*Face for minibuffer reminder of possible completion key bindings."
  :group 'Icomplete-Plus)

(when (< emacs-major-version 23)
  (defcustom icompletep-prospects-length 100 ; Default was 80
    "*Length of string displaying icompletion candidates."
    :type 'integer :group 'Icomplete-Plus))

(when (> emacs-major-version 22)
  (defcustom icompletep-include-menu-items-flag  t
    "*Non-nil means include menu bindings in the list of keys for a command."
    :type 'boolean :group 'Icomplete-Plus))

;;; Quiet the byte-compiler.
(defvar icomplete-overlay)
(defvar icomplete-prospects-height)



;; REPLACES ORIGINAL defined in `icomplete.el':
;;
;; Save match-data.
;; Don't insert if input begins with `(' (e.g. `repeat-complex-command').
;;
(when (< emacs-major-version 23)        ; Emacs 20, 21, 22.
  (defun icomplete-exhibit ()
    "Insert icomplete completions display.
Should be run via minibuffer `post-command-hook'.
See `icomplete-mode' and `minibuffer-setup-hook'."
    (when (icomplete-simple-completing-p)
      (save-match-data
        (let* ((minibuf-begin     (if (< emacs-major-version 21)
                                      (point-min)
                                    (minibuffer-prompt-end)))
               (contents          (buffer-substring minibuf-begin (point-max)))
               (buffer-undo-list  t))
          (save-excursion
            (goto-char (point-max))
            ;; Register the end of input, so we know where the extra stuff
            ;; (match-status info) begins:
            (unless (boundp 'icomplete-eoinput)
              ;; In case it got wiped out by major mode business:
              (make-local-variable 'icomplete-eoinput))
            (setq icomplete-eoinput  (point))
            ;; Insert the match-status information:
            (when (and (> (point-max) minibuf-begin)
                       (save-excursion  ; Do nothing if looking at a list, string, etc.
                         (goto-char minibuf-begin)
                         (not (looking-at ; No (, ", ', 9 etc. at start.
                               "\\(\\s-+$\\|\\s-*\\(\\s(\\|\\s\"\\|\\s'\\|\\s<\\|[0-9]\\)\\)")))
                       (or
                        ;; Do not bother with delay after certain number of chars:
                        (> (point-max) icomplete-max-delay-chars)
                        ;; Do not delay if alternatives number is small enough:
                        (if minibuffer-completion-table
                            (cond ((numberp minibuffer-completion-table)
                                   (< minibuffer-completion-table
                                      icomplete-delay-completions-threshold))
                                  ((sequencep minibuffer-completion-table)
                                   (< (length minibuffer-completion-table)
                                      icomplete-delay-completions-threshold))))
                        ;; Delay - give some grace time for next keystroke, before
                        ;; embarking on computing completions:
                        (sit-for icomplete-compute-delay)))
              (insert
               (icomplete-completions contents minibuffer-completion-table
                                      minibuffer-completion-predicate
                                      (not minibuffer-completion-confirm)))))
          (setq deactivate-mark  nil)))))) ; Don't let the insert deactivate the mark.


;;; These two macros are defined in `subr.el' for Emacs 23+.
;;; They are included here only so you can, if needed, byte-compile this file using Emacs < 23
;;; and still use the byte-compiled file in Emacs 23+.
(unless (fboundp 'with-local-quit)
  (defmacro with-local-quit (&rest body)
    "Execute BODY, allowing quits to terminate BODY but not escape further.
When a quit terminates BODY, `with-local-quit' returns nil but
requests another quit.  That quit will be processed as soon as quitting
is allowed once again.  (Immediately, if `inhibit-quit' is nil.)"
    `(condition-case nil
      (let ((inhibit-quit  nil))
        ,@body)
      (quit (setq quit-flag  t)
       ;; This call is to give a chance to handle quit-flag
       ;; in case inhibit-quit is nil.
       ;; Without this, it will not be handled until the next function
       ;; call, and that might allow it to exit thru a condition-case
       ;; that intends to handle the quit signal next time.
       (eval '(ignore nil)))))
  (put 'with-local-quit 'common-lisp-indent-function '(&body)))

(unless (fboundp 'while-no-input)
  (defmacro while-no-input (&rest body) ; Defined in `subr.el'.
    "Execute BODY only as long as there's no pending input.
If input arrives, that ends the execution of BODY,
and `while-no-input' returns t.  Quitting makes it return nil.
If BODY finishes, `while-no-input' returns whatever value BODY produced."
    (let ((catch-sym  (make-symbol "input")))
      `(with-local-quit
        (catch ',catch-sym
          (let ((throw-on-input  ',catch-sym))
            (or (input-pending-p)  (progn ,@body)))))))
  (put 'while-no-input 'common-lisp-indent-function '(&body)))



;; REPLACES ORIGINAL defined in `icomplete.el':
;;
;; 1. Do not include menu items unless `icompletep-include-menu-items-flag'.
;; 2. Do not wrap with `<...>', since:
;;    (a) not needed because we do not include `Matched;', so [...] suffices
;;    (b) `<...>' is also used for function keys, so it would be confusing
;; 3. If string of keys would be too long then shorten it using `...',
;;    or if even `[ ... ]' would be too long then return `TOO-LONG' so the
;;    brackets can be removed altogether.
;;
(defun icomplete-get-keys (func-name &optional exactp)
  "Return strings naming keys bound to FUNC-NAME, or nil if none.
Examines the prior, not current, buffer, presuming that current buffer
is minibuffer.

Non-nil optional arg EXACTP means FUNC-NAME is an exact match, as
determined by `try-completion' or `completion-try-completion.

If option `icompletep-include-menu-items-flag' is non-nil then include
menu-bar bindings in the l of keys (Emacs 23+ only)."
  (when (commandp func-name)
    (save-excursion
      (let* ((sym      (intern func-name))
             (buf      (other-buffer nil t))
             (keys     (with-current-buffer buf (where-is-internal sym)))
             (max-len  (max 0 (-  (window-width)
				  (if (fboundp 'minibuffer-prompt-end)
                                      (minibuffer-prompt-end)
                                    (point-max))
				  (if (fboundp 'minibuffer-prompt-end) (length func-name) 0)
                                  (if exactp 7 9) ; 6 SPC, () around FUNC-NAME, 1 SPC after )
                                  5)))) ; 1 space + 2 each for `[ ' and ` ]'
	(when keys
          (unless (and (boundp 'icompletep-include-menu-items-flag)
                       icompletep-include-menu-items-flag)
            (setq keys  (icompletep-remove-if (lambda (ky)
                                                (and (vectorp ky)  (eq (aref ky 0) 'menu-bar)))
                                              keys)))
	  (setq keys  (mapconcat 'key-description
                                 (sort keys #'(lambda (x y) (< (length x) (length y))))
                                 ", "))
          (cond ((zerop max-len) (setq keys  'TOO-LONG))
                ((> (length keys) max-len)
                 (setq keys  (concat (substring keys 0 (max 0 (- max-len 5))) "...")))))
        keys))))

(defun icompletep-remove-if (pred xs)
  "A copy of list XS with no elements that satisfy predicate PRED."
  (let ((result  ()))
    (dolist (x  xs)  (unless (funcall pred x) (push x result)))
    (nreverse result)))


;; REPLACES ORIGINAL defined in `icomplete.el':
;;
;; Save match-data.
;; Don't insert if input begins with `(' (e.g. `repeat-complex-command').
;;
(when (> emacs-major-version 22)        ; Emacs 23+
  (defun icomplete-exhibit ()
    "Insert icomplete completions display.
Should be run via minibuffer `post-command-hook'.  See `icomplete-mode'
and `minibuffer-setup-hook'."
    (when (and icomplete-mode  (icomplete-simple-completing-p))
      (save-excursion
        (goto-char (point-max))
        ;; Insert the match-status information.
        (when (and (> (point-max) (minibuffer-prompt-end))
                   buffer-undo-list     ; Wait for some user input.
                   (save-excursion      ; Do nothing if looking at a list, string, etc.
                     (goto-char (minibuffer-prompt-end))
                     (save-match-data
                       (not (looking-at ; No (, ", ', 9 etc. at start.
                             "\\(\\s-+$\\|\\s-*\\(\\s(\\|\\s\"\\|\\s'\\|\\s<\\|[0-9]\\)\\)"))))
                   (or
                    ;; Do not bother with delay after certain number of chars:
                    (> (- (point) (field-beginning)) icomplete-max-delay-chars)
                    ;; Do not delay if alternatives number is small enough:
                    (and (sequencep minibuffer-completion-table)
                         (< (length minibuffer-completion-table)
                            icomplete-delay-completions-threshold))
                    ;; Delay - give some grace time for next keystroke, before
                    ;; embarking on computing completions:
                    (sit-for icomplete-compute-delay)))
          (let ((text              (while-no-input (icomplete-completions
                                                    (field-string)
                                                    minibuffer-completion-table
                                                    minibuffer-completion-predicate
                                                    (not minibuffer-completion-confirm))))
                (buffer-undo-list  t)
                deactivate-mark)
            ;; Do nothing if `while-no-input' was aborted.
            (when (stringp text)
              (move-overlay icomplete-overlay (point) (point) (current-buffer))
              ;; The current C cursor code doesn't know to use the overlay's
              ;; marker's stickiness to figure out whether to place the cursor
              ;; before or after the string, so let's spoon-feed it the pos.
              (put-text-property 0 1 'cursor t text)
              (overlay-put icomplete-overlay 'after-string text))))))))



;; REPLACES ORIGINAL defined in `icomplete.el':
;;
;; 1. Prepends total number of candidates.
;; 2. Sorts alternatives, puts them in a different face, and separates them more.
;; 3. Highlights key-binding text, truncating it if too long.
;; 4. Appends number of remaining cycle candidates (for Icicles).
;;
(when (< emacs-major-version 23)        ; Emacs 20, 21, 22.
  (defun icomplete-completions (name candidates predicate require-match)
    "Identify prospective candidates for minibuffer completion.
NAME is the name to complete.
CANDIDATES are the candidates to match.
PREDICATE filters matches: they succeed only if it returns non-nil.
REQUIRE-MATCH non-nil means the input must match a candidate.

The display is updated with each minibuffer keystroke during
minibuffer completion.

Prospective completion suffixes (if any) are displayed, bracketed by
\"()\", \"[]\", or \"{}\".  The choice of brackets is as follows:

  \(...) - A single prospect is identified, and matching is enforced.
  \[...] - A single prospect is identified, and matching is optional.
  \{...} - Multiple prospects are indicated, and further input is
          needed to distinguish a single one.

The displays for unambiguous matches have ` [ Matched ]' appended
\(whether complete or not), or ` \[ No matches ]', if no eligible
matches exist.  Keybindings for uniquely matched commands are
shown within brackets, [] (without the word \"Matched\"), if there is
room.

When more than one completion is available, the total number precedes
the suffixes display, like this:
  M-x forw    14 (ard-) { char line list...}

If library `icicles.el' is also loaded, then you can cycle
completions.  When you change cycling direction, the number of
additional cycle candidates, besides the current one, is displayed
following the rest of the icomplete info:
  M-x forward-line   [Matched]  (13 more)."
    ;; `all-completions' doesn't like empty `minibuffer-completion-table's (ie: (nil))
    (when (and (listp candidates)  (null (car candidates))) (setq candidates  ()))
    (let* ((comps                     (all-completions name candidates predicate))
           (open-bracket-determined   (if require-match "("   " ["))
           (close-bracket-determined  (if require-match ") "  "] "))
           (keys                      ())
           (nb-candidates             (length comps))
           nb-candidates-string)
      ;; `concat'/`mapconcat' is the slow part.  With the introduction of
      ;; `icompletep-prospects-length', there is no need for `catch'/`throw'.
      (if (null comps) (format (if (fboundp 'icicle-apropos-complete)
                                   "\t%sNo prefix matches%s"
                                 "\t%sNo matches%s")
                               open-bracket-determined
                               close-bracket-determined)
        (let* ((most-try                 (try-completion name (mapcar #'list comps)))
               (most                     (if (stringp most-try) most-try (car comps)))
               (most-len                 (length most))
               (determ                   (and (> most-len (length name))
                                              (concat open-bracket-determined
                                                      (substring most (length name))
                                                      close-bracket-determined)))
               (open-bracket-prospects   "{ ")
               (close-bracket-prospects  " }")
               (prospects-len            0)
               prompt prompt-rest prospects most-is-exact comp)
          (when determ
            (put-text-property 0 (length determ) 'face 'icompletep-determined determ))
          (if (eq most-try t)
              (setq prospects  ())
            (while (and comps  (< prospects-len icompletep-prospects-length))
              (setq comp   (substring (car comps) most-len)
                    comps  (cdr comps))
              (cond ((string-equal comp "") (setq most-is-exact  t))
                    ((member comp prospects))
                    (t (setq prospects      (cons comp prospects)
                             prospects-len  (+ (length comp) 1 prospects-len))))))
          (setq prompt-rest
                (if prospects
                    (concat open-bracket-prospects
                            (and most-is-exact  ", ")
                            (mapconcat 'identity (sort prospects (function string-lessp)) "  ")
                            (and comps  "...")
                            close-bracket-prospects)
                  (setq keys  (and icomplete-show-key-bindings
                                   (commandp (intern-soft most))
                                   (icomplete-get-keys most (eq t most-try))))
                  (if (eq keys 'TOO-LONG)       ; No room even for ` [ ... ]'.
                      ""
                    (concat " [ " (and (not keys)  "Matched") keys " ]"))))
          (unless (string= "" prompt-rest)
            (put-text-property 0 (length prompt-rest)
                               'face 'icompletep-choices prompt-rest))
          (cond ((< nb-candidates 2)
                 (setq prompt  (concat "      " determ prompt-rest)) ; 6 spaces.
                 (when (eq last-command this-command)
                   (setq icicle-nb-of-other-cycle-candidates  0))) ; We know now, so reset it.
                (t
                 (setq nb-candidates-string  (format "%7d " nb-candidates))
                 (put-text-property (string-match "\\S-" nb-candidates-string)
                                    (1- (length nb-candidates-string))
                                    'face 'icompletep-nb-candidates nb-candidates-string)
                 (setq prompt  (concat nb-candidates-string determ prompt-rest))))
          ;; Highlight keys.
          (when (stringp keys) (put-text-property (+ 9 (length determ)) (1- (length prompt))
                                                  'face 'icompletep-keys prompt))
          ;; Append mention of number of other cycle candidates (from `icicles.el').
          (when (and (boundp 'icicle-last-completion-candidate)
                     (> icicle-nb-of-other-cycle-candidates 0)
                     (= 1 nb-candidates)
                     icicle-last-completion-candidate
                     (not (eq last-command this-command)))
            (setq nb-candidates-string  ; Reuse the string.
                  (format "  (%d more)" icicle-nb-of-other-cycle-candidates))
            (put-text-property (string-match "\\S-" nb-candidates-string)
                               (length nb-candidates-string)
                               'face 'icompletep-nb-candidates nb-candidates-string)
            (setq prompt  (concat prompt nb-candidates-string)))
          prompt)))))



;; REPLACES ORIGINAL defined in `icomplete.el':
;;
;; 1. Prepends total number of candidates.
;; 2. Sorts alternatives alphabetically, puts them in a different face, and separates them more.
;; 3. Highlights key-binding text, truncating it if too long.
;; 4. Appends number of remaining cycle candidates (for Icicles).
;;
(when (= emacs-major-version 23)
  (defun icomplete-completions (name collection predicate require-match)
    "Identify prospective candidates for minibuffer completion.
NAME is the name to complete.
COLLECTION is the collection of candidates to match.
PREDICATE filters matches: they succeed only if it returns non-nil.
REQUIRE-MATCH non-nil means the input must match a candidate.

The display is updated with each minibuffer keystroke during
minibuffer completion.

Prospective completion suffixes (if any) are displayed, bracketed by
\"()\", \"[]\", or \"{}\".  The choice of brackets is as follows:

  \(...) - A single prospect is identified, and matching is enforced.
  \[...] - A single prospect is identified, and matching is optional.
  \{...} - Multiple prospects are indicated, and further input is
          needed to distinguish a single one.

The displays for unambiguous matches have ` [ Matched ]' appended
\(whether complete or not), or ` \[ No matches ]', if no eligible
matches exist.  Keybindings for uniquely matched commands are
shown within brackets, [] (without the word \"Matched\"), if there is
room.

When more than one completion is available, the total number precedes
the suffixes display, like this:
  M-x forw    14 (ard-) { char line list...}

If library `icicles.el' is also loaded, then you can cycle
completions.  When you change cycling direction, the number of
additional cycle candidates, besides the current one, is displayed
following the rest of the icomplete info:
  M-x forward-line   [Matched]  (13 more)."
    ;; `all-completions' doesn't like empty `minibuffer-completion-table's (ie: (nil))
    (when (and (listp collection)  (null (car collection))) (setq collection  ()))
    (let* (;; Do not use `completion-all-sorted-completions' as in vanilla Emacs.
           ;; We need the number of comps, and we do not need that sort order.
           ;; (comps (completion-all-sorted-completions))

           ;; Exclude file names with extensions in `completion-ignored-extensions'.
           (comps            (if (and minibuffer-completing-file-name
                                      icomplete-with-completion-tables)
                                 (completion-pcm--filename-try-filter
                                  (all-completions name collection predicate))
                               (all-completions name collection predicate)))
           (nb-candidates    (length comps))
           (nb-cands-string  (if (< nb-candidates 2) "" (format "%7d " nb-candidates)))
;;; We do not use `completion-all-sorted-completions', so we do not need `last' or `base-size'.
;;; $$$$$      (last          (if (consp comps) (last comps)))
;;;            (base-size     (cdr last))
           (open-bracket     (if require-match "("   " ["))
           (close-bracket    (if require-match ") "  "] ")))
      ;; `concat'/`mapconcat' is the slow part.
      (if (not (consp comps))
          (format (if (fboundp 'icicle-apropos-complete)
                      "\t%sNo prefix matches%s"
                    "\t%sNo matches%s")
                  open-bracket close-bracket)
;;; $$$$$   (if last (setcdr last ()))
        (let* ((keys           ())
               (most-try
                ;; We do not use BASE-SIZE.  So we just use `try-completion'.
;;;             (if (and base-size (> base-size 0))
;;;                 (completion-try-completion name collection predicate (length name))
;;;               ;; If the COMPS are 0-based, the result should be the same with COMPS.
;;;               (completion-try-completion name comps nil (length name))))
                (try-completion name collection predicate))
               ;; Since we use `try-completion', MOST-TRY will not be a cons.
               ;; (most        (if (consp most-try) (car most-try) (if most-try (car comps) "")))
               (most           (if (stringp most-try) most-try (car comps)))
               ;; Compare NAME and MOST, so we can determine if NAME is
               ;; a prefix of MOST, or something else.
               (compare        (compare-strings name nil nil most nil nil
                                                completion-ignore-case))
               (determ         (and (not (or (eq t compare)  (eq t most-try)
                                             (= (setq compare  (1- (abs compare))) (length most))))
                                    (concat open-bracket
                                            (cond ((= compare (length name)) ; NAME is a prefix
                                                   (substring most compare))
                                                  ((< compare 5) most)
                                                  (t (concat "..." (substring most compare))))
                                            close-bracket)))
               (prospects-len  (+ (if (and (boundp 'icicle-mode)  icicle-mode  (icicle-completing-p))
				      2	; for `icicle-completion-prompt-overlay'
				    0)
                                  (string-width (buffer-string)) ; for prompt
				  (length nb-cands-string)
				  (length determ) ; for determined part
				  2     ; for "{ "
				  -2    ; for missing last "  " after last candidate
				  5))	; for "... }"
               (prospects-max
                ;; Max total length to use, including the minibuffer content.
                (* (+ icomplete-prospects-height
                      ;; If the minibuffer content already uses up more than
                      ;; one line, increase the allowable space accordingly.
                      (/ prospects-len (window-width)))
                   (window-width)))
               (prefix-len
                ;; Find the common prefix among `comps'.
                ;; Cannot use the optimization below because its assumptions
                ;; are not always true, e.g. when completion-cycling (Emacs bug #10850):
                ;; (if (eq t (compare-strings (car comps) nil (length most)
                ;; 			 most nil nil completion-ignore-case))
                ;;     ;; Common case.
                ;;     (length most)
                ;; Else, use try-completion.
                (let ((comps-prefix  (try-completion "" comps)))
                  (and (stringp comps-prefix)  (length comps-prefix))))
               prompt prompt-rest prospects most-is-exact comp limit)
          (when determ
            (put-text-property 0 (length determ) 'face 'icompletep-determined determ))
          (if (eq most-try t)           ; (or (null (cdr comps))
              (setq prospects  ())
            (while (and comps  (not limit))
              (setq comp   (if prefix-len (substring (car comps) prefix-len) (car comps))
                    comps  (cdr comps))
              (cond ((string-equal comp "") (setq most-is-exact  t))
                    ((member comp prospects))
                    (t (setq prospects-len  (+ (string-width comp)
                                               2 ; for "  "
                                               prospects-len))
                       (if (< prospects-len prospects-max)
                           (push comp prospects)
                         (setq limit  t))))))
;;; $$$$$    ;; Restore the base-size info, since `completion-all-sorted-completions' is cached.
;;;          (when last (setcdr last base-size))
          (setq prompt-rest
                (if prospects
                    (concat "{ " (and most-is-exact  ", ")
                            (mapconcat 'identity (sort prospects (function string-lessp)) "  ")
                            (and limit  "...")
                            " }")
                  (setq keys  (and icomplete-show-key-bindings
                                   (commandp (intern-soft most))
                                   (icomplete-get-keys most (eq t most-try))))
                  (if (eq keys 'TOO-LONG) ; No room even for `[ ... ]'.
                      ""
                    (concat " [ " (and (not keys)  "Matched") keys " ]"))))
          (unless (string= "" prompt-rest)
            (put-text-property 0 (length prompt-rest) 'face 'icompletep-choices prompt-rest))
          (cond ((< nb-candidates 2)
                 (setq prompt  (concat "      " determ prompt-rest)) ; 6 spaces.
                 (when (eq last-command this-command)
                   (setq icicle-nb-of-other-cycle-candidates  0))) ; We know now, so reset it.
                (t
                 (put-text-property (string-match "\\S-" nb-cands-string)
                                    (1- (length nb-cands-string))
                                    'face 'icompletep-nb-candidates nb-cands-string)
                 (setq prompt  (concat nb-cands-string determ prompt-rest))))
          ;; Highlight keys.
          (when (stringp keys) (put-text-property (+ 9 (length determ)) (1- (length prompt))
                                                  'face 'icompletep-keys prompt))
          ;; Append mention of number of other cycle candidates (from `icicles.el').
          (when (and (boundp 'icicle-last-completion-candidate)
                     (> icicle-nb-of-other-cycle-candidates 0)
                     (= 1 nb-candidates)
                     icicle-last-completion-candidate
                     (not (eq last-command this-command)))
            (setq nb-cands-string       ; Reuse the string.
                  (format "  (%d more)" icicle-nb-of-other-cycle-candidates))
            (put-text-property (string-match "\\S-" nb-cands-string)
                               (length nb-cands-string)
                               'face 'icompletep-nb-candidates nb-cands-string)
            (setq prompt  (concat prompt nb-cands-string)))
          prompt)))))


;; REPLACES ORIGINAL defined in `icomplete.el':
;;
;; 1. Prepends total number of candidates.
;; 2. Sorts alternatives alphabetically, puts them in a different face, and separates them more.
;; 3. Highlights key-binding text, truncating it if too long.
;; 4. Appends number of remaining cycle candidates (for Icicles).
;;
(when (> emacs-major-version 23)        ; Emacs 24+.
  (defun icomplete-completions (name candidates predicate require-match)
    "Identify prospective candidates for minibuffer completion.
NAME is the name to complete.
CANDIDATES is the collection of candidates to match.  See
`completing-read' for its possible values.
PREDICATE filters matches: they succeed only if it returns non-nil.
REQUIRE-MATCH non-nil means the input must match a candidate.

The display is updated with each minibuffer keystroke during
minibuffer completion.

Prospective completion suffixes (if any) are displayed, bracketed by
\"()\", \"[]\", or \"{}\".  The choice of brackets is as follows:

  \(...) - A single prospect is identified, and matching is enforced.
  \[...] - A single prospect is identified, and matching is optional.
  \{...} - Multiple prospects are indicated, and further input is
          needed to distinguish a single one.

The displays for unambiguous matches have ` [ Matched ]' appended
\(whether complete or not), or ` \[ No matches ]', if no eligible
matches exist.  Keybindings for uniquely matched commands are
shown within brackets, [] (without the word \"Matched\"), if there is
room.

When more than one completion is available, the total number precedes
the suffixes display, like this:
  M-x forw    14 (ard-) { char line list...}

If library `icicles.el' is also loaded, then you can cycle
completions.  When you change cycling direction, the number of
additional cycle candidates, besides the current one, is displayed
following the rest of the icomplete info:
  M-x forward-line   [Matched]  (13 more)."
    ;; `all-completions' does not like empty `minibuffer-completion-table's (ie: (nil))
    (when (and (listp candidates)  (null (car candidates)))  (setq candidates  ()))
    (let* ((non-essential    t)

           ;; Do not use MD.  It is used only for `completion-try-completion', and we don't use that.
;;;        (md               (completion--field-metadata (field-beginning)))

           ;; Do not use `completion-all-sorted-completions' as in vanilla Emacs.
           ;; We need the number of COMPS, and we do not need that sort order.
;;;        (comps (completion-all-sorted-completions))

           ;; Exclude file names with extensions in `completion-ignored-extensions'.
           (comps            (if (and minibuffer-completing-file-name
                                      icomplete-with-completion-tables)
                                 (completion-pcm--filename-try-filter
                                  (all-completions name candidates predicate))
                               (all-completions name candidates predicate)))
           (nb-candidates    (length comps))
           (nb-cands-string  (if (< nb-candidates 2) "" (format "%7d " nb-candidates)))

           ;; We do not use `completion-all-sorted-completions', so we do not need LAST or BASE-SIZE.
;;;        (last          (if (consp comps) (last comps)))
;;;        (base-size     (cdr last))
           
           (open-bracket     (if require-match "("   " ["))
           (close-bracket    (if require-match ") "  "] ")))
      ;; `concat'/`mapconcat' is the slow part.
      (if (not (consp comps))
          (format (if (fboundp 'icicle-apropos-complete)
                      "\t%sNo prefix matches%s"
                    "\t%sNo matches%s")
                  open-bracket close-bracket)
;;;     (if last (setcdr last ()))
        (let* ((keys           ())
               (most-try
                ;; We do not use BASE-SIZE, and the second `if' clause raises an error if CANDIDATES
                ;; is a function.  So we just use `try-completion'.
;;;             (if (and base-size (> base-size 0))
;;;                 (completion-try-completion name candidates predicate (length name) md)
;;;               ;; If the COMPS are 0-based, the result should be the same with COMPS.
;;;               (completion-try-completion name comps nil (length name) md)))
                (try-completion name candidates predicate))
               ;; Since we use `try-completion', MOST-TRY will not be a cons.
               ;; (most        (if (consp most-try) (car most-try) (if most-try (car comps) "")))
               (most           (if (stringp most-try) most-try (car comps)))
               ;; Compare NAME & MOST, to determine if NAME is a prefix of MOST, or something else.
               (compare        (compare-strings name nil nil most nil nil completion-ignore-case))
               (determ         (and (not (or (eq t compare)  (eq t most-try)
                                             (= (setq compare  (1- (abs compare))) (length most))))
                                    (concat open-bracket
                                            (cond ((= compare (length name)) ; NAME is a prefix
                                                   (substring most compare))
                                                  ((< compare 5) most)
                                                  (t (concat "..." (substring most compare))))
                                            close-bracket)))
               (prospects-len  (+ (if (and (boundp 'icicle-mode)  icicle-mode  (icicle-completing-p))
				      2	; for `icicle-completion-prompt-overlay'
				    0)
                                  (string-width (buffer-string)) ; for prompt
				  (length nb-cands-string)
				  (length determ) ; for determined part
				  2     ; for "{ "
				  -2    ; for missing last "  " after last candidate
				  5))	; for "... }"
               (prospects-max
                ;; Max total length to use, including the minibuffer content.
                (* (+ icomplete-prospects-height
                      ;; If the minibuffer content already uses up more than
                      ;; one line, increase the allowable space accordingly.
                      (/ prospects-len (window-width)))
                   (window-width)))
               (prefix-len
                ;; Find the common prefix among COMPS.
                ;; Cannot use the optimization below because its assumptions are not always true,
                ;; e.g. when completion-cycling (Emacs bug #10850):
                ;; (if (eq t (compare-strings (car comps) nil (length most)
                ;; 			 most nil nil completion-ignore-case))
                ;;     (length most) ; Common case.
                ;; Else, use try-completion.
                (let ((comps-prefix  (try-completion "" comps)))
                  (and (stringp comps-prefix)  (length comps-prefix))))
               prompt prompt-rest prospects most-is-exact comp limit)
          (when determ
            (put-text-property 0 (length determ) 'face 'icompletep-determined determ))
          (if (eq most-try t)           ; (or (null (cdr comps))
              (setq prospects  ())
            (while (and comps  (not limit))
              (setq comp   (if prefix-len (substring (car comps) prefix-len) (car comps))
                    comps  (cdr comps))
              (cond ((string-equal comp "") (setq most-is-exact  t))
                    ((member comp prospects))
                    (t (setq prospects-len  (+ (string-width comp)
                                               2 ; for "  "
                                               prospects-len))
                       (if (< prospects-len prospects-max)
                           (push comp prospects)
                         (setq limit  t))))))
;;;       ;; Restore the BASE-SIZE info, since `completion-all-sorted-completions' is cached.
;;;       (if last (setcdr last base-size))
          (setq prompt-rest
                (if prospects
                    (concat "{ " (and most-is-exact  ", ")
                            (mapconcat 'identity (sort prospects (function string-lessp)) "  ")
                            (and limit  "...")
                            " }")
                  (setq keys  (and icomplete-show-key-bindings
                                   (commandp (intern-soft most))
                                   (icomplete-get-keys most (eq t most-try))))
                  (if (eq keys 'TOO-LONG) ; No room even for `[ ... ]'.
                      ""
                    (concat " [ " (and (not keys)  "Matched") keys " ]"))))
          (unless (string= "" prompt-rest)
            (put-text-property 0 (length prompt-rest) 'face 'icompletep-choices prompt-rest))
          (cond ((< nb-candidates 2)
                 (setq prompt  (concat "      " determ prompt-rest)) ; 6 spaces.
                 (when (eq last-command this-command)
                   (setq icicle-nb-of-other-cycle-candidates  0))) ; We know now, so reset it.
                (t
                 (put-text-property (string-match "\\S-" nb-cands-string)
                                    (1- (length nb-cands-string))
                                    'face 'icompletep-nb-candidates nb-cands-string)
                 (setq prompt  (concat nb-cands-string determ prompt-rest))))
          ;; Highlight keys.
          (when (stringp keys) (put-text-property (+ 9 (length determ)) (1- (length prompt))
                                                  'face 'icompletep-keys prompt))
          ;; Append mention of number of other cycle candidates (from `icicles.el').
          (when (and (boundp 'icicle-last-completion-candidate)
                     (> icicle-nb-of-other-cycle-candidates 0)
                     (= 1 nb-candidates)
                     icicle-last-completion-candidate
                     (not (eq last-command this-command)))
            (setq nb-cands-string       ; Reuse the string.
                  (format "  (%d more)" icicle-nb-of-other-cycle-candidates))
            (put-text-property (string-match "\\S-" nb-cands-string)
                               (length nb-cands-string)
                               'face 'icompletep-nb-candidates nb-cands-string)
            (setq prompt  (concat prompt nb-cands-string)))
          prompt)))))

;;;;;;;;;;;;;;;;;;;;;;;

(provide 'icomplete+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; icomplete+.el ends here

