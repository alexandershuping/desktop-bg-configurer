#!/bin/bash

FILES_DIRECTORY=$( cd "$(dirname "$0")" ; pwd -P )

echo "base: $FILES_DIRECTORY"

for image in $(ls $FILES_DIRECTORY/to_add | sed -n '/README/!p');do
	mv $FILES_DIRECTORY/to_add/$image $FILES_DIRECTORY/all/$image
	ln -s $FILES_DIRECTORY/all/$image $FILES_DIRECTORY/active/$image
done
