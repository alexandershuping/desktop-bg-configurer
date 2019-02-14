#!/bin/bash

FILES_DIRECTORY=$( cd "$(dirname "$0")" ; pwd -P )

CHOSEN_IMAGE=$(ls $FILES_DIRECTORY/active | sed -n '/README/!p' | shuf -n 1)
echo "chose $FILES_DIRECTORY/active/$CHOSEN_IMAGE."

feh --bg-fill $FILES_DIRECTORY/active/$CHOSEN_IMAGE
