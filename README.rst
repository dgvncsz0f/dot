=====
 dot
=====

My .rc files.

Installing
==========

Assuming you have git installed::

  $ sh <(curl -k -s https://raw.github.com/dgvncsz0f/dot/master/bin/dot-install) [options]

  # Alternatively:
  $ sh bin/dot-install clean=1 remote=file:///path/to/your/dot/project [options]

Where options might be:

  * clean=1      : remote previous .dot directory (otherwise will try git pull);
  * debug=1      : print debug messages;
  * remote=url   : custom git url (default: git://github.com/dgvncsz0f/dot.git);
  * dot_home=dir : directory to clone/update (default $HOME/.dot);
