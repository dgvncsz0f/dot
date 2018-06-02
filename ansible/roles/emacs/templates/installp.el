; -*- mode: emacs-lisp; -*-

(require 'package)

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(let ((f (lambda (acc x) (and acc (package-installed-p x))))
      (all-packages (list {{ emacs_packages|map(attribute="name")|map('regex_replace', '^(.*)$', '\'\\1')|join(' ')}})))
  (unless (cl-reduce f all-packages :initial-value t)
    (package-refresh-contents)))

{% for item in emacs_packages %}
(unless (package-installed-p '{{ item.name }})
  (package-install '{{ item.name }}))
{% for item1 in item.requires|default([item.name]) %}
(require '{{ item1 }})
{% endfor %}
{% endfor %}
