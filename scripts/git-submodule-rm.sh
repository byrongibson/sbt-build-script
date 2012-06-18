#!/usr/bin/env bash -

# remove a submodule
# ref:  http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule
#       http://stackoverflow.com/questions/10220140/git-rm-r-cached-not-removing-submodule-folder-and-contents
#
# EXAMPLES
# $> sh git-rm-submodule.sh submodules/bootstrap 
#   - no leading or trailing /
#   - run in repo root dir
#   - assumes the submodule 'bootstrap' is located in [repo root]/submodules/bootstrap
#
# INFO
# To remove a submodule you need to:

# 0.  It is a good idea to do git rebase HEAD first and git commit at the end, if you 
#   put this in a script.  If there are rebase conflicts, resolve them as with normal 
#   merge conflicts, then 'git add -A', then 'git rebase --continue' to finish the rebase.
#   (http://book.git-scm.com/4_rebasing.html)
#
# 1.  Run git rm -r path_to_submodule (no trailing slash).
#   $> git rm -r $submodulepath
#   (don't use --cached.  Need to delete from both index and working tree, but
#   --cached only deletes $submodulepath from index, leaves it in working tree.)
#
# 2.  Delete the relevant line from the .gitmodules file.
#   $> git config -f .gitmodules --remove-section submodule.$submodulepath
#   (no leading or trailing / when you specify $submodulepath at cmdline)
#
# 3.  Delete the relevant section from .git/config.
#   $> git config -f .git/config --remove-section submodule.$submodulepath
#   (no leading or trailing / when you specify $submodulepath at cmdline)
#
# 4.  Commit and delete the now untracked submodule files.
#
# When you do git submodule add, it only adds it to .gitmodules, but once you did git submodule 
#   init it has been added to .git/config too.
# 
# TODO
# 1.  Add error handling (wtb transactions)
#   - http://www.linuxcommand.org/lc3_wss0140.php
#   - http://www.linuxcommand.org/lc3_wss0150.php
#   - http://www.stackoverflow.com/questions/64786/error-handling-in-bash
#   - http://www.linuxforums.org/forum/programming-scripting/108038-stopping-error-bash-loop.html
#   - http://www.linuxquestions.org/questions/programming-9/bash-script-and-loop-error-handling-325817

if [ -z "$1" ]; then
    echo "No command-line arguments.  Aborting..."
    echo "Please specify the submodule to remove."
    echo "Usage: sh git-rm-submodule.sh submodules/module-name"
    exit;     
fi


echo "Rebasing HEAD ..."
git rebase HEAD

echo "Executing 'git rm $1' ..."
git rm -rf $1

echo "Executing 'rm -rf $1' ..."
rm -rf $1

echo "Executing 'git config -f .gitmodules --remove-section submodule.$1' ..."
git config -f .gitmodules --remove-section submodule.$1

echo "Executing 'git config -f .git/config --remove-section submodule.$1' ..."
git config -f .git/config --remove-section submodule.$1

echo "Adding and Committing ..."
git commit -am "removed submodule $1"
echo "Done.  Removed submodule $1 ..."
