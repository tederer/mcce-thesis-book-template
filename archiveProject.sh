#!/bin/bash

# This script puts the project into a TGZ with a unique name (by incrementing a number in the name) 
# which is located in the parent folder. The content of "out" gets ignored.

archivePrefix="mcce-thesis-book-template_"
archiveSuffix=".tgz"

scriptDir=$(cd $(dirname $0) && pwd)

cd $scriptDir
lastIndex=$(ls .. | grep -E "$archivePrefix[0-9]+\.tgz" | cut --delimiter="_" --fields=2 | cut --delimiter="." --fields=1 | sort | tail -n 1)

if [ "$lastIndex" == "" ]; then
   lastIndex=0
fi
nextIndex=$(printf "%04d" $(echo "$lastIndex + 1" | bc))
archiveName="${archivePrefix}${nextIndex}${archiveSuffix}"

echo "creating archive $archiveName ..."
tar --exclude=./out -czf ../$archiveName ./*
