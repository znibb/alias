#!/bin/bash

##### Hooks #####
VALID_FLAGS="(-rpi)"

# Read user input and build invocation
echo "Setting up hook to auto-run copytohome.sh on git merge"
echo "Enter relevant flags "$VALID_FLAGS" or none for base aliases only"
read flags
INVOCATION="./copytohome.sh "$flags
echo "Writing hook invoking: "$INVOCATION

# Create hook
echo "#!/bin/bash" > .git/hooks/post-merge
echo >> .git/hooks/post-merge
echo $INVOCATION >> .git/hooks/post-merge

# Make hook script executable
chmod +x .git/hooks/post-merge

##### Cronjob #####
# Get path to repo and create/update cron job doing git pull
REPO_PATH=$(cd "$(dirname "$0")" && pwd)
GIT_PATH=$(which git)
command="cd $REPO_PATH && $GIT_PATH pull origin master"
job="0 0,12 * * * $command" # Run at 00:00 and 12:00
cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -
