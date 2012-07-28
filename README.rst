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

  * clean=1      : force using git clone instead of git pull;
  * debug=1      : turn debug messages on;
  * remote=url   : the git url (default: git://github.com/dgvncsz0f/dot.git);
  * dot_home=dir : directory to clone/update (default $HOME/.dot);
