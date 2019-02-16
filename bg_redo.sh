#!/bin/bash

DN=$(dirname "$0")
BN=$(basename "$0")

SYM_DIRECTORY=$DN
FILES_DIRECTORY=$(readlink $SYM_DIRECTORY/$BN)

if [ -n "$FILES_DIRECTORY" ];then
	echo "File is symlinked. Finding base path..."
	FILES_DIRECTORY=$(echo "$FILES_DIRECTORY" | sed 's/\/[^\/]*$//')
else
	FILES_DIRECTORY=$SYM_DIRECTORY
fi

FILES_DIRECTORY=$(cd $FILES_DIRECTORY; pwd -P)
echo "Base directory: $FILES_DIRECTORY"

if [ ! -e "$FILES_DIRECTORY/currently_selected" ];then
	$FILES_DIRECTORY/select_background.sh
fi

feh --bg-fill $FILES_DIRECTORY/currently_selected
