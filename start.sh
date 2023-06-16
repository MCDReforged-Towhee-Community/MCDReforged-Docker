#!/bin/bash

# 1. Init work directory
# If /mcdreforged does not exist, report an error
if [[ -d "/mcdreforged" ]]
then
    # If the directory is empty, execute the directory init
    if [[ ! "$(ls -A /mcdreforged)" ]]; then
        echo "Preparing files needed for first run."
        # Copy init file to work directory
        cp -r /mcdreforged_init/* /mcdreforged/
    fi
else
	echo "Directory mcdreforged not found."
fi

# 2. Run mcdreforged
exec python -m mcdreforged
