### problem_push.sh
Automatically save today's algorithm challenge to GitHub.

#### Notes
1. This assumes that you have already created and initalized a repository for your toy problems.
2. To get the absolute path to your toy-problems directory, run this
    ```
        $ cd /Path/To/toy-problems
        
        $ pwd
    ```
    and add an extra slash at the end, e.g. `/Users/YOU/Some/Directory/toy-problems/`
3. You can exit the script by typing `Ctrl + C` at the 'Did you find a solution?' prompt.
    - This will create the file within your toy-problems directory, but will not push it to GitHub. 

#### Directions
1. DO THIS ONLY ONCE: To allow this script to execute, run the following command:
    ```
        $ cd /Path/To/Directory/Containing/problem_push
        
        $ chmod +x ./problem_push.sh
    ```
2. Under `# Configuration`:
    - Assign `path` to the absolute path to toy-problems.
    - Assign `filename` to the name of the interview challenge, include the extension (.js)!
3. Under `# Solution`:
    - Paste your solution, your attempted solution, or at least the description of the problem.
    - White space matters! Align your solution left. If the spacing looks strange, you probably used tabs instead of spaces! (\t)
4. After initial setup, for each use, you should only have to change `filename` and paste in your solution!
5. Run `bash problem_push.sh`.
