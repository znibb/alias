#!/bin/bash

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
