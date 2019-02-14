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

for image in $(ls $FILES_DIRECTORY/to_add | sed -n '/README/!p');do
	mv $FILES_DIRECTORY/to_add/$image $FILES_DIRECTORY/all/$image
	ln -s ../all/$image ./active/$image
done
