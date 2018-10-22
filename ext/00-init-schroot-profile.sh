#!/bin/sh
SCHROOT_PATH="/etc/schroot/$PROJECT_NAME"
if [ -d /etc/schroot ]; then
  if [ ! -d $SCHROOT_PATH ]; then
    mkdir -p $SCHROOT_PATH
    touch $SCHROOT_PATH/copyfiles
    touch $SCHROOT_PATH/nssdatabases
    echo "# <file system> <mount point>   <type>  <options>       <dump>  <pass>
/proc           /proc           none    rw,bind         0       0
/sys            /sys            none    rw,bind         0       0
/dev            /dev            none    rw,bind         0       0
/dev/pts        /dev/pts        none    rw,bind         0       0
/tmp            /tmp            none    rw,bind         0       0" > $SCHROOT_PATH/fstab
    echo "W: Schroot profile for project has created at $SCHROOT_PATH"
  else
    echo "I: Looks like $SCHROOT_PATH already exist. Do nothing!"
  fi
else
  echo "E: There is no path to generate profile"
fi
