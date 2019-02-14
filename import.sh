#!/bin/bash

ROOT_PATH=$(dirname "$0")

for image in $(ls $ROOT_PATH/to_add | sed -n '/README/!p');do
	mv $ROOT_PATH/to_add/$image $ROOT_PATH/all/$image
	ln -s ../all/$image ./active/$image
done
