#!/bin/bash

## Today's date
today=$(date +%Y-%m-%d)

## Check and create a today's directory if it doesn't exist.
if [ ! -d $today ]
then
  echo "Creating directory"
  mkdir -p ./$today
else
  echo $today " directory exists"
fi

## Copy files in current directory into a new subdirectory labelled with today's date.
find ./ -type f ! -name '.*' -maxdepth 1 -exec cp '{}' ./$today \;
echo "Copy complete"


## Show files to be deleted
echo "Files to delete:"
find ./ -type f ! -name '.*' -maxdepth 1 -exec echo "{}" \;

## Delete "loose" files on confirmation.
## Stack Overflow magic (http://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-alias)
read -r -p "Are you sure? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    find ./ -type f ! -name '.*' -maxdepth 1 -exec rm '{}' \;
    echo "Deleted files"
else
    echo "Delete aborted"
fi
