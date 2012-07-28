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

Overlay
=======

There is a mechanism to apply small patches or replace files entirely
per site. This is called overlay.

For this to work, there must a directory $HOME/dot.overlay, with one
or more of the following directories (execution order):

  * $HOME/dot.overlay/create/
  * $HOME/dot.overlay/prpend/
  * $HOME/dot.overlay/append/
  * $HOME/dot.overlay/update/

Example, to create a new file named foo under $HOME/.dot/bin and to
change .ssh/config:

  $ touch $HOME/dot.overlay/create/bin/foo
  $ echo "# last line" >$HOME/dot.overlay/append/dot.ssh/config

