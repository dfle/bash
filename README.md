# bash

This folder contains simple scripts I've duct-taped together for my own use.  
Feedback is appreciated. Use at your own risk.
___
### loose_files.sh
Move all files in the current working directory into a new subdirectory labelled with today's date.
+ Use case: Put all of the day's webcast screenshots into a single folder for easy review.

#### Notes
1. This has not been thoroughly tested.
2. This is my first bash script.
3. This should only move loose files within the current directory. It will not move files in existing subdirectories.
4. I'm using *bash 3.2*.

#### Directions
1. Navigate to the directory that is to be organized, and run the script.
     ```
        $ cd /Path/To/Current/Directory
        $ bash /Path/To/loose_files.sh
    ```
2. Files will be copied to a new folder within the current directory, labelled with today's date, e.g. '2016-03-22'.
3. Confirm `Are you sure? [y/N]` to delete the loose files.

#### TODO:
[ ] exclude `loose_files.sh` from deletion if it is in the current directory.

[ ] check if all files have been successfully copied.

[ ] reduce redundancy: learn how to process CLI output as objects, arrays and/or store output as variables(?).
