=====
 dot
=====

My dot files.

This is the repository where I keep all my configuration files [emacs,
git, shell stuff etc.]. This project does nothing but hold the
files. The one responsible for deploying them into the filesystem is
the `dot-install <https://github.com/dgvncsz0f/dot-install>`_ project.

You should refer to that project for more information about how this
is done.

However, the long short-long history is this:

* Each directory represents a module;

* Each module has one or more tags [$module/tags directory];

* When you invoke `dot-install`, you tell which tags you want to
  install. In other words, if you want to use my emacs files, and
  nothing else, you could do::

  $ dot-install install=emacs repo=git://github.com/dgvncsz0f/dot.git

Each module should have a README, describing how things are organized.

The most complex module so far is the emacs one. It has a number of
sub-modules [although there is no hierarchy between modules] and a
couple of modules makes use of pre-install hooks:

* emacs/magit

* emacs/wanderlust

That should be a good reference if one is considering using
`dot-install` to manage its own files.
