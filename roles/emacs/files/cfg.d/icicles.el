(require 'icicles-mac)

(icicle-define-command
 icicle-projectile-find-file
 "Jump to a project's file using completion. With a prefix ARG invalidates the cache first."
 (lambda (x)
   (find-file x)
   (run-hooks 'projectile-find-file-hook))
 "File: "
 (mapcar (lambda (x) (projectile-expand-root x)) (projectile-current-project-files)))

(icicle-define-command
 icicle-projectile-find-dir
 "Jump to a project's file using completion. With a prefix ARG invalidates the cache first."
 (lambda (x)
   (find-file x)
   (run-hooks 'projectile-find-dir-hook))
 "Directory: "
 (mapcar (lambda (x) (projectile-expand-root x)) (projectile-current-project-dirs)))

(icicle-mode t)
