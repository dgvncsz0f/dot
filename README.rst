=====
 dot
=====

My dot files.

This is the repository where I keep all my configuration files [emacs,
git, shell related stuff etc.]. This project does nothing but hold the
files. The one responsible for deploying them into the filesystem is
the `dot-install <https://github.com/dgvncsz0f/dot-install>`_ project.

You should refer to that project for more information about how this
is done.

However, the long short-long history is this:

* Things are organized in modules, under the modules dir. Modules are
  simply directories with an special `dist` dir;

* There are also bundles, which groups modules together. You may think
  them as a profile;

* When you invoke `dot-install`, you tell what *bundles* or *modules*
  you want to install. For instance, if you want to use my emacs
  files, and nothing else::

  $ sh <(curl -s https://raw.github.com/dgvncsz0f/dot-install/master/dot-install) module=editor/emacs

  The above command will replace you `~/.emacs` with no mercy. To just
  stage the files::

    $ sh <(curl -s https://raw.github.com/dgvncsz0f/dot-install/master/dot-install) module=editor/emacs dryrun=1

  That will only stage the files into a temporary location, so that you can review what will be done.

Ideally each module will have a README describing how things are
organized.

The most complex module so far is the emacs one. It has the
configuration split over a number of extra modules, which may be used
independendetly.

The bash module is somewhat similar, but has much less extra modules.

Those two should give you a prime example of how to organize/use
things.
