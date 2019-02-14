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

for image in $(ls $FILES_DIRECTORY/to_add | sed -n '/README/!p');do
	mv $FILES_DIRECTORY/to_add/$image $FILES_DIRECTORY/all/$image
	ln -s $FILES_DIRECTORY/all/$image $FILES_DIRECTORY/active/$image
done
