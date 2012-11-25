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

* Things are organized in modules. Modules are directories with an
  special `dist` dir;

* When you invoke `dot-install`, you tell what *modules* you want to
  install. In reality you just provide one or more directories and the
  script will install everything in it (all modules with a *dist* dir
  defined). For instance, if you want to use my emacs files, and
  nothing else::

  $ dot-install install=emacs repo=git://github.com/dgvncsz0f/dot.git

Ideally each module will have a README describing how things are
organized.

The most complex module so far is the emacs one. It has a number of
sub-modules [although there is no hierarchy between modules] and a
couple of modules makes use of install hooks.
