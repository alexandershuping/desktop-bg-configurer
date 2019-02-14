#!/bin/bash

FILES_DIRECTORY=$(dirname "$0")

CHOSEN_IMAGE=$(ls $FILES_DIRECTORY/active | sed -n '/README/!p' | shuf -n 1)
echo "chose $FILES_DIRECTORY/active/$CHOSEN_IMAGE."

feh --bg-fill $FILES_DIRECTORY/active/$CHOSEN_IMAGE
