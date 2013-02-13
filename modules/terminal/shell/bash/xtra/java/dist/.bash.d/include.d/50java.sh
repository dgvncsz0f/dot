#!/bin/sh

[ -d /opt/java/jre ] && {
  export JAVA_HOME=/opt/java/jre
  export PATH=$PATH:$JAVA_HOME/bin
}
