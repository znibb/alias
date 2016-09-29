#!/bin/bash
# Copies repo files to home dir, will create dir ~/scripts for support scripts if not already present
#
# Usage: ./copytohome.sh [options]
#
# Options:
#    -rpi	Include RPi-specific aliases
#

function verboseOutput(){
# Echo argument to stdio if VERBOSE was set to true during invocation
  if [ "$VERBOSE" = true ]; then
    echo "$1"
  fi
}

# Process arguments
while [[ $# -gt 0 ]]
do
  opt=$1

  case $opt in 
    -v)
      VERBOSE=true
      shift
      ;;
    -rpi)
      RPI=true
      shift
      ;;
    *)
      # Unknown option
      verboseOutput "Unknown option $opt"
      exit 1
      ;;
  esac
done

verboseOutput "Writing aliases to .bash_aliases"

# Copy base aliases to temp file
cp .bash_aliases_base .bash_aliases

# Check for additional aliases to include
if [ "$RPI" = true ]; then
  verboseOutput "Including RPi aliases"
  echo $(cat .bash_aliases_rpi) >> .bash_aliases
fi

# Move assembled aliases file to home dir
mv -f .bash_aliases ~/.bash_aliases

# Copy support script
if [ ! -d ~/scripts ]; then
  mkdir ~/scripts
fi

if [ "$RPI" = true ]; then
  cp -u showcoretemp.sh ~/scripts/showcoretemp.sh
fi

# Done, exit
verboseOutput "Done"
exec bash
exit 0
