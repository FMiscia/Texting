"add all specific file in the entire project
git add "*.txt"

" deletes a remote branch 
git push origin --delete branch_name " or :branch_name

" delete a file
git rm file1 "deletes the file and untrack
git rm --cached file1 "just stop tracking the file. It wont be deleted
git commit -m "removed file1"


" shows remote branches
git branch -r

" Make origin the default remote for that branch
git push -u origin master

"link local branch name with remote branch name
git push origin mybranch:master

" Merge the commit with the previous one 
git commit --amend 

" adds and commits everything except untraked files
git commit -a -m "bla"

" soft reset: reset into staging are the files in the specified commit. Like
" amend
git reset --soft HEAD^

" hard reset: delete the specified commits
git reset --hard HEAD^

" Marks a commit as a fix of a previous commit 
"   info: http://fle.github.io/git-tip-keep-your-branch-clean-with-fixup-and-autosquash.html
"   works with: git rebase -i --autosquash 
git commit --fixup <commit>

"rebase
git rebase branch1 " move the unique commits of branch1 below the unique commits of the actual branch 
git rebase -i branch1 "interactive rebase with branch1
git rebase -i HEAD~3 "rebase of the last 3 commits (used for reoreding)
"interactive rebase keyword
"       - reword: changes commit description
"       - edit: used for split
"               -git reset HEAD^ :unstage the files
"               -git add file(s) :stage file(s) separately
"               -git commit :commit staged file(s) separately
"               -git rebase --continue
"       - squash: merge commits togheter with the previous commit
"       - fixup: like squash but deletes the subject of the fixup commit


" Automatically organize merging of fixup commits and associated normal commits 
"   info: http://fle.github.io/git-tip-keep-your-branch-clean-with-fixup-and-autosquash.html 
git rebase -i --autosquash

" cherry-picking
git cherry-pick hash "put the commit to the current branch
git cherry-pick --edit hash "to change commit message
" the following fuse 2 commits. no-commits takes the changes and stage them. You have to COMMIT them 
git cherry-pick --no-commit hash1 hash2
git cherry-pick -x hash "track the commit as cherry picked
git cherry-pick --signoff hash "adds who has cherry picked (current user)

" submodule
" share libraries across projects. Creates a git repo inside a git repo
git submodule add git@example.com:example.git
git commit 
git push
git push parent-project
" a .gitmodules has been created. 

" cloning submodule in your project
git submodule init "configure .config file
git submodule update " pull files. The files are not in any BRANCHES
" modify submodules you have updated: you cannot commit, because you are not in
" any branch if you forgot to push it before
git branch branchname commit-hash "create a temp branch where to put your commit
git merge commit-hash "will merge the commit on master branch

" abort a push if you haven't pushed a submodule
git push --recurse-submodules=check

" push automatically submodules when you push the project
git push --recurse-submodules=on-demand "make it as an alias git config alias.pushall \"push --recurse-submodules=on-demand\"

"Selecting revisions:
" Both ~ and ^ on their own refer to the parent of the commit (~~ and ^^ both refer to the grandparent commit, etc.) But they differ in meaning when they are used with numbers:
"
" ~2 means up two levels in the hierarchy, via the first parent if a commit has more than one parent
" ^2 means the second parent where a commit has more than one parent (i.e. because it's a merge)
" These can be combined , so HEAD~2^3 means HEAD's grandparent commit's third parent commit.

" Selecting revisions: How to select my parent 
git show HEAD^ or git show HEAD~

" Selecting revisions: How to select my grandparent 
git show HEAD~2 or git show HEAD^2

" Sow log 
git log --oneline "short report
git log --oneline --stat "shows insertion and deletion
git log --patch "shows also pathces
git log --graph "short report with tree structure (use also with --oneline)
git log --oneline --decorate "short report with color decoraiton for branches,HEADS, ..
git log --pretty=format:"%h %an %s %ad" "custom report with short hash, author name, subject, date
git log --until=1.minute.ago "shows log until 1 minute ago (use also hour,day or month)
git log --since=1.day.ago "shows log since 1 day ago
git log --since=2012-12-21 --until=1.month.ago "shows log between those dates (relative and absolute)
git log --walk-reflogs "to see the reflogs in a full format

" Compress repository 
git gc --aggressive //(or git gc --aggressive --prune=now)

" modify history
" BACKUP FIRST git clone project project-test && cd project-test

"tree-filter
git filter-branch --tree-filter <command> "git will check each commit out, run the command (any shell command), and re-commit
" options:
git filter-branch --tree-filter <command> -- --all "means in all commits in all branches (HEAD instead of --all filter only current branch)
" example:
git filter-branch --tree-filter 'rm -f passwords.txt' -- HEAD

" index filter
git filter-branch --index-filter <command> "operates on staging area (so use git commands)
"example
git filter-branch --index-filter 'git rm --cached --ignore-unmatch password.txt' "ignore-unmatch avoid the filter to stop

"forces filter-branch (gits makes a backup of your first filter-branch which
"won't override)
git filter-branch -f 

"deletes (prune) empty commits
git filter-branch -f --prune-empty -- --all

" restore activity
git reflog "will show activity on the current branch 
git reset --hard HEAD@{1} " will recover that action. If it was a commit you could use also its hash
git reflog show branch_name " will show the activity on the specified branch
git reset --hard branch_name@{id} " restore a branch

" diff 
git diff --staged " diff with staged files
git diff HEAD~5 " diff of 5 commits ago
git diff commit1..commit2 " diff between 2 commits (use hash or HEAD or even branches)

" blame: who codes this?
git blame file " use--date short for better results

" shows remotes
git remote -v

" show remote details
git remote show origin

" remove remote
git remote rm origin

" remove branches deleted on the remote
git remote prune origin

" tags
git tag " list tags
git checkout <tagname> " checkout the code 
git tag -a tagname -m "description" " creates a new tag
git push --tags " push new tags

"stashing
git stash save "optional message" " save files in a temporary area (stash stack)
git stash apply " Get back stashed file
git stash list "shows stash list
git stash apply stash@{0} "apply a particular stash (default is stash@{0})
git stash drop "remove the top
git stash pop "gets the top and then drops it
git stash save --keep-index " causes staging area not to be stashed
git stash save --include-untracked " include untracked in staging area
git stash list --stat " gives addition and deletion in stash stack. Use all the command option of the log command
git stash show stash@{2} "shows information about that stashed entry
git stash show "gives the details of the most recest stash. As for list you can use any option command of git log
git stash branch branch_name stash@{0} " used when the branch where we stashed was deleted. So creates a new branch. 
git stash clear "clear the stack

"line ending
git config --global core.autocrlf input  "on Linux/OSX systems changes CRLF to LF on commit
git config --global core.autocrlf true "on Windows systems changes LF to CRLF, but converts back to LF on commit
git config --global core.autocrlf false "no conversion
"attributes file: .gitattribute file

"excluding files: 
"edit .git/info/exclude or use .gitignore file

" configuration
git config --global user.name "name" " configure name globally (or user.email)
git config --global core.editor vim " configure preferred editor
git config --global merge.tool opendiff " configure merge tool
git config --list " shows configuration

" aliases
git config --global alias.alias_name "git command" "add global alias, also without \" for single commands

