#!/bin/bash

# (DO THIS ONLY ONCE) To allow this script to execute, run the following command:
## chmod +x ./problem_push.sh

# Configuration
############### Edit FILENAME and PATH here ###############
filename='allAnagrams.js' ## NAME YOUR FILE HERE
path='/Path/To/toy-problems/' ## ABSOLUTE PATH TO DIRECTORY HERE
remote='origin' ## Alias of your repo name, e.g. git push origin master
branch='master' ## Branch you'd like to push to
############### Edit FILENAME and PATH above ###############

## Check and create a script file if it doesn't exist. Write to it.
if [ ! -f $path$filename ]
then
  echo "+++ Creating file $filename"
  echo "+++ Writing to file $path$filename"

# Solution
############### PASTE YOUR SOLUTION HERE, BETWEEN THE WRITEFILE TAGS ###########
############### ALIGN YOUR SOLUTION LEFT -- whitespace matters #################
  cat > $path$filename <<"WRITEFILE"
// Given a single input string, write a function that produces all possible anagrams of a string and outputs them as an array.
// At first, don’t worry about repeated strings. What time complexity is your solution?
// Input: "abc"
// Output: [ "abc", "acb", "bac", "bca", "cab", "cba" ]

function allAnagrams (string) {
  var results=[];

  var recurse = function(temp, letters) {
    if (temp.length === string.length && results.indexOf(temp) === -1) {
      results.push(temp);
    }
    for (var i=0; i<letters.length; i++) {
      var firstLetter = letters[i];
      var nextLetters = letters.slice(0,i) + letters.slice(i+1);
      recurse(temp + firstLetter, nextLetters);
    }
  }
  recurse('', string);
  return results;
}
WRITEFILE
############### PASTE YOUR SOLUTION ABOVE, BETWEEN THE WRITEFILE TAGS ##########

  ### This waits until your file is done being written before pushing to GitHub.
  while [ ! -f $path$filename ];
  do
    sleep 1;
  done;
  sleep 1;

  echo "+++ Wrote to file $filename"
  cat $path$filename;

else
  echo "+++ $filename file exists"
fi

# GitHub -- Add, Conditionally Commit, Push
### Saves command that allows access to a local git repo without cding it.
git="git --git-dir=$path.git --work-tree=$path"

## git add
$git add $filename

## Conditional commit messsages based on whether you
## 1) solved, 2) attempted or are 3) adding the description of the problem.

#### This prompts the user whether they have solved the toy problem
#### to determine the appropriate commit message
read -r -p "+++ Did you find a solution? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
  $git commit -m "[solve] $filename"
  echo "+++ Changes to $filename are staged with commit message: [solve] $filename"
else
  read -r -p "+++ Are you adding your attempted solution? [y/N] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    $git commit -m "[attempt] $filename"
    echo "+++ Changes to $filename are staged with commit message: [attempt] $filename"
  else
    $git commit -m "[add] $filename"
    echo "+++ Changes to $filename are staged with commit message: [add] $filename"
  fi
fi

echo "+++ Pushing staged changes to $remote $branch"
$git push $remote $branch
echo "+++ Changes have been pushed"
