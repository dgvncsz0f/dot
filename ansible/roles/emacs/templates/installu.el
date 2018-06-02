; -*- mode: emacs-lisp; -*-

(require 'dx15_emacswiki)

{% for item in emacswiki.download %}
(unless (dx15_emacswiki/installed-p "{{ item }}")
  (dx15_emacswiki/install "{{ item }}"))
{% endfor %}

{% for item in emacswiki.requires %}
(require '{{ item }})
{% endfor %}
