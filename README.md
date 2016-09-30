# alias
My commonly used aliases and their various support functions

#### Usage
1. Clone repo to anywhere on your system
2. Open copytohome.sh and check existing flags
3. Run `./copytohome.sh [flags]` to assemble .bash_aliases and move it to your home dir
4. Run `./setup_hooks.sh` and when prompted submit relevant flags, copytohome.sh will now be run automatically everytime you merge a new release

#### File descriptions:
* .bash_aliases_base
  - Contains base aliases that will always be relevant
* .bash_aliases_rpi
  - Contains RPi-specific aliases
* copytohome.sh
  - Script that assembles your .bash_aliases and places it in your home folder
* setup_hooks.sh
  - Run once on repo setup to create a hook that runs copytohome.sh on every successful `git merge`
* showcoretemp.sh
  - Support script for showing CPU core temp in a RPi
