#!/bin/sh
echo -n "I: Configuring APT repositories... "
echo "deb $DISTR_REPO/$DISTR_FLAVOUR/ $DISTR_FAMILY main universe
deb $DISTR_REPO/$DISTR_FLAVOUR/ $DISTR_FAMILY-security main universe
deb $DISTR_REPO/$DISTR_FLAVOUR/ $DISTR_FAMILY-updates main universe" > $PROJECT_PATH/etc/apt/sources.list
printf "\e[92mDONE\e[0m\n"
