(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

(unless (package-installed-p 'clj-refactor)
  (package-install 'clj-refactor))
