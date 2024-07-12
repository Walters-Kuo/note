Note : Git servers might allow you to rename Git branches using the web interface or external programs (like Sourcetree, etc.),
but you have to keep in mind that in Git all the work is done locally,

要拆除尚未上傳的 commit
git reset HEAD~1 //HEAD~2 會拆掉還未上傳的最後兩個 commit

如果您不希望更改文件，只是想取消 commit
git reset --soft HEAD~1

如果您不希望更改文件，也不希望取消 commit，而是想完全刪除最後一個 commit
git reset --hard HEAD~1

If .DS_Store was never added to your git repository, simply add it to your .gitignore file.
In your the root directory of your app and simple write
\*\*/.DS_Store

if it's already there, write in your terminal:
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch

git status

git log --oneline

Check on which branch you are using the command below
git branch -a

撤銷尚未 commit 的變更
git checkout -- .
git checkout -- index.html

從 Git 的追蹤列表中移除該檔案，但不會刪除實際的檔案
git rm --cached /public/dist/index.html

case : 想把 master 改成 stage 而 prod 改成　master
git checkout master
git pull #The first two steps are a useful precaution to ensure your local copy of master is up-to-date.
git branch -m old_branch new_branch
git push origin :old_branch

#use the “ours” merge strategy to overwrite master with seotweaks like this:
git checkout better_branch
git merge --strategy=ours master # keep the content of this branch, but record a merge
git checkout master
git merge better_branch # fast-forward master up to the merge

修改到一半，不想commit
git stash
接著就可以 git checkout <otherBranch>

切回剛剛的 branch 後，要怎麼拿回剛剛存的狀態呢?
git stash list
stash@{0}: WIP on feature/23030701-報表總覽下拉

git stash pop stash@{0}
git stash pop //沒有指定要 pop 哪一個 Stash，會從編號最小的，也就是 stash@{0} 開始拿

git stash 的小衝突
git stash list 是空的

//寫到一半的檔案要切到新的 branch
git stash; new branch; git stach pop

將 uncommitted changes stage 起來
git add -u .

拉回暫存的內容
git stash pop

unstage 所有檔案, 放棄本地修改，回到上一版
git reset
git reset --hard

git commit -m "conflict fixed"
When you have resolved this problem, run "git rebase --continue".
If you prefer to skip this patch, run "git rebase --skip" instead.
To check out the original branch and stop rebasing, run "git rebase --abort".

git blame 查哪一行是誰改的

git reset is a good option when you realize that the changes being made to a particular local branch should be somewhere else.
You can reset and move to the desired branch without losing your file changes.

If you want to undo a commit and the all the changes made after that commit, you attach the --hard flag
git reset 5914db0
git reset 89f6c3d --hard

git revert is a good option for reverting changes pushed to a remote repository. Since this command creates a new commit,
you can safely get rid of your mistakes without rearranging the commit history for everyone else.
git revert 882ad02

1.Core:
• git init
• git clone
• git add
• git commit
• git status
• git diff
• git checkout
• git reset
• git log
• git show
• git tag
• git push
• git pull

2.Branching:
• git branch
• git checkout -b
• git merge
• git rebase
• git branch --set-upstream-to
• git branch --unset-upstream
• git cherry-pick

3.Merging:
• git merge
• git rebase

4.Stashing:
• git stash
• git stash pop
• git stash list
• git stash apply
• git stash drop

5.Remotes:
• git remote
• git remote add
• git remote remove
• git fetch
• git pull
• git push
• git clone --mirror

6.Configuration:
• git config
• git global config
• git reset config

7. Plumbing:
   • git cat-file
   • git checkout-index
   • git commit-tree
   • git diff-tree
   • git for-each-ref
   • git hash-object
   • git ls-files
   • git ls-remote
   • git merge-tree
   • git read-tree
   • git rev-parse
   • git show-branch
   • git show-ref
   • git symbolic-ref
   • git tag --list
   • git update-ref

8.Porcelain:
• git blame
• git bisect
• git checkout
• git commit
• git diff
• git fetch
• git grep
• git log
• git merge
• git push
• git rebase
• git reset
• git show
• git tag

9.Alias:
• git config --global alias.<alias> <command>

10.Hook:
• git config --local core.hooksPath <path>

11.Experimental: (May not be fully Supported)
• git annex
• git am
• git cherry-pick --upstream
• git describe
• git format-patch
• git fsck
• git gc
• git help
• git log --merges
• git log --oneline
• git log --pretty=
• git log --short-commit
• git log --stat
• git log --topo-order
• git merge-ours
• git merge-recursive
• git merge-subtree
• git mergetool
• git mktag
• git mv
• git patch-id
• git p4
• git prune
• git pull --rebase
• git push --mirror
• git push --tags
• git reflog
• git replace
• git reset --hard
• git reset --mixed
• git revert
• git rm
• git show-branch
• git show-ref
• git show-ref --heads
• git show-ref --tags
• git stash save
• git subtree
• git tag --delete
• git tag --force
• git tag --sign
• git tag -f
• git tag -l
• git tag --verify
• git unpack-file
• git update-index
• git verify-pack
• git worktree

github
ssh-keygen -t ed25519 -C "your_email@example.com"
/Users/xxx/.ssh/id-ed25519
