#!/bin/bash

FOLDERS=`ls $HOME/Nextcloud/pictures/ | grep -v "20230707" | grep -v "20230720"`
echo $FOLDERS

FOLD=
for fil in $FOLDERS
do
	FOLD="$FOLD $HOME/Nextcloud/pictures/$fil/"
done

feh -Y -x -q -D 10 -B black -F -Z -z -r $FOLD

