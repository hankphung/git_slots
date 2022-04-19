# git_slots
Shell commands to give lazy people like me the ability to remember the working branch names and switch branch easily
# Installation
## For zsh users
If you don't have your `.zshrc` yet, simply copy the file and put it in your home folder. Otherwise just copy the content of the file and paste into your `.zshrc` file.
Don't forget to reload it with `source ~/.zshrc`.
## Bash shell users
Just copy it into your `.bashrc` or the `.bash_aliases`.
# Usage
To setup the .clipboard folder, cd into your repo and run `setup_clipboard`

```sh
_>: cd /path/to/my_repo
_>my_repo: setup_clipboard
done!
_>my_repo: b
1
2
3
4
5
6
7
8
9
10
```
To save the current working branch into the slot 1:
```sh
_>my_repo: git status
On branch branch-that-i-used-to-know
nothing to commit, working tree clean
_>my_repo: put 1
got it!
_>my_repo: b
1 branch-that-i-used-to-know
2
3
...
```
Let say you're in another branch and you want to checkout the branch in slot 1
```sh
_>my_repo: b
1 branch-that-i-used-to-know
2 yet-to-be-done
3
...
_>my_repo: git status
On branch yet-to-be-done
nothing to commit, working tree clean
_>my_repo: c 1
Switched to branch branch-that-i-used-to-know
```
To save a random value into a slot:
```sh
_>my_repo: put 2 'some not_important_string!'
got it!
_>my_repo: b
1 branch-that-i-used-to-know
2 some not_important_string!
3
...
```
The value that you saved in a slot can be used later in your commands
```sh
_>my_repo: b
1 branch-that-i-used-to-know
2 some not_important_string!
3
...
_>my_repo: myval=`read-clipboard 1`
_>my_repo: echo $myval
some not_important_string!
```