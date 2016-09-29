# alias
My commonly used aliases and their various support functions

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
