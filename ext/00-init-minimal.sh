#!/bin/sh
mkdir -p $PROJECT_PATH
debootstrap --variant=buildd --arch=$DISTR_ARCH $DISTR_FAMILY $PROJECT_PATH $DISTR_REPO/$DISTR_FLAVOUR
echo "D: Exit code for debootstrap is $?"
