#!/bin/sh
# Copies repo files to home dir, will create dir ~/scripts for support scripts if not already present

# Copy base aliases to temp file
cp .bash_aliases_base .bash_aliases

# Query if rpi-specific aliases should be included
while true; do
  read -p "Include aliases specific to Raspberry Pi? (Y/n) " yn
  case $yn in
    [Nn]* ) break;;
    * ) echo $(cat .bash_aliases_rpi) >> .bash_aliases; break;;
  esac
done

# Move assembled aliases file to home dir and relaunch bash to source aliases
mv -f .bash_aliases ~/.bash_aliases
exec bash

# Copy support script
if [ ! -d ~/scripts ]; then
  mkdir ~/scripts
fi
cp -u showcoretemp.sh ~/scripts/showcoretemp.sh
