#!/bin/bash

# (DO THIS ONLY ONCE) To allow this script to execute, run the following command:
## chmod +x ./problem_push.sh

# Configuration
############### Edit OUTPUT and PATH here ###############
output='output.js' ## NAME YOUR OUTPUT FILE HERE
path='./' ## ABSOLUTE PATH to toy-problems here.
input='./input.js' ## Path to input.js
remote='origin' ## Alias of your repo name, e.g. git push origin master
branch='master' ## Branch you'd like to push to
############### Edit OUTPUT and PATH above ###############

## Create a script file if it doesn't exist. Write to it.
if [ ! -f $path$output ]
then
  echo "+++ Creating file $output"
  echo "+++ Writing to file $path$output"

  ## Write contents of input.js to configured output.
  cat $input >> $path$output

  ## Wait until your file is done being written before pushing to GitHub.
  while [ ! -f $path$output ];
  do
    sleep 1;
  done;
  sleep 1;

  echo "+++ Wrote to file $output"
  cat $path$output;

else
  echo "+++ $output file exists"
fi

# GitHub -- Add, Conditionally Commit, Push
## Saves command that allows access to a local git repo without cding it.
git="git --git-dir=$path.git --work-tree=$path"

## git add
$git add $output

## Prompts whether you've solved the toy problem to determine the appropriate commit message.
read -r -p "+++ Did you find a solution? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
  $git commit -m "[solve] $output"
  echo "+++ Changes to $output are staged with commit message: [solve] $output"
else
  read -r -p "+++ Are you adding your attempted solution? [y/N] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    $git commit -m "[attempt] $output"
    echo "+++ Changes to $output are staged with commit message: [attempt] $output"
  else
    $git commit -m "[add] $output"
    echo "+++ Changes to $output are staged with commit message: [add] $output"
  fi
fi

## git push
$git push $remote $branch
echo "+++ Changes have been pushed"
