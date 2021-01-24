# Git Basics

### Basics

Architecture: working tree, staging area, repository

File states: `modified` | `staged` | `commited` | `untracked`

Get help: `git help <verb>`

Repository by way of either: `clone` or `init`
`git clone <url>`
`git clone <url> <target-dir>`

Print a compact status:
`git status -bs` 

Add a file or current verison of a file to staging:
`git add <file>`
Or update all modified tracked files:
`git add -u`

Unstage staged files
`git reset HEAD <file>`
`git restore --staged <file>`

Untrack files (remove cached flag if you want to delete as well)
`git rm --cached <files>`
`git rm -rf --cached <files`

Discard changes in working directory 
`git checkout -- <file>`
`git restore <file>`

Commit staged changes to repository
`git commit`
`git commit -m`
`git commit --ammend`

Skip staging, and simply commit all modified files
`git commit -a`
`git commit -am '<msg>'`

Show exact patch with 
`git diff` (working dir vs staging)
`git diff --staged` (staging vs repository)

### Ignore

Ignore files via `.gitignore` file; set this up before adding HUGE
data files by accident as this will create embarrasing network issues.
- Globbing patterns work for gitignore
- `#` is a commentline, any line starting with `#` are skipped
- pattern matching is applied recursively
- starting pattern with `/` prevents recursivity
- negate patterns with `!`

Ignore patterns:
- `*` arbitrary number of characters
- `[abc]` matches any character in brackets
- `?` matches single character
- `[0-9]` matches any character in interval
- `**` can be used to match nested directories

### Log

Show only <limit> commits
`git log -<limit>`

Show patches for each commit
`git log -p` 

Show each commit on one line (really useful with grep)
`git log --pretty=oneline`
`git log --pretty=oneline | grep <search> | cut -d' ' -f1` 
`git log --grep` <- this also exists

Format specifically, useful for parsing without depending
on git updates not changing the format, or making it readable
`git log --pretty=format:"%h - %an, %ar : %s"`
`git log --pretty=format:"%h %s" --graph`

Filter log based on whether a specific string was added/removed in the diff
`git log -S <string>` 

Filter log based on if file was modified
`git log -- path/to/file`
`git log --since=2.weeks -- path/to/file`

Other useful options include `--since` `--until` `--author` `--committer` `--no-merges`

### Remote

List remote handles (`-v` for urls)
`git remote`
`git remote -v`

Add remote handles
`git remote add <shortname> <url>`

Retrieve information held in remote repo
`git fetch <remote>`

Fetch then merge from tracked remote branch
`git pull`

Push changes to tracked branch or specified branch
`git push`
`git push <remoteref> <branch>`

Inspecting remotes
`git remote show <shortname>`

Modifying
`git remote rename <before> <after>`
`git remote remove <shortname>`

### Tags

List existing tags
`git tag`

Created annotated tag with message
`git tag -a <tagname> -m <message>`

Create lightweight tag
`git tag <tagname>`

Create a tag for an earlier commit
`git tag -a <tagname> <commithash>`

Push a tag
`git push <remote> <tagname>`

Or piggyback tags on regular pushes
`git push <remote> --tags`

Delete a tag locally
`git tag -d <tagname>`

Delete a tag remotely
`git push <remote> --delete <tagname>`

Detach HEAD at tag 
`git checkout <tagname>`

Checkout tag into branch
`git checkout -b <branchname> <tagname>`

### Git Aliasing

Scoped aliases are quite nice for separation of concerns, while
still optimizing some keystrokes.

```
[alias]
	lg = log -10 --pretty=format:\"%Cred%h %C(auto,yellow)%an %Cgreen%s\"
  co = checkout
  cm = commit
  st = status -bs
  conf = config --global
  last = lg -1 HEAD
  unstage = reset HEAD --
```

### Branching

Create a new branch (but don't switch to it)
`git branch <name>`

List branches
`git branch`

Delete a branch
`git branch -d <branch>`

Show branch pointers in log
`git log --all --oneline --decorate`
`git log --oneline --decorate --all --graph`

Switch to an existing branch or create it on the fly
`git checkout <branch>`
`git checkout -b <newbranch>`

`git switch` can do some of these things more intuitively, 
but is still experimental.

It is best to avoid switching branches with a clean
working state. Stashing and cleaning can help with this.

On switching to a branch your working directory will be 
set to the state of the last commit on that branch.

### Merging

Merge target branch into current
`git merge <targetbranch>`

If the target branch can be reached by simply moving the
pointer of the current branch to the latest commit of said
target, this is the applied merge strategy, named "fast-forward".

Merge conflicts may arise:

```
<<<<<<<< HEAD:file.r
this is what is in current branch
========
this is what is in target branch
>>>>>>>> target:file.r
```

Abort current merge
`git merge --abort` 

Launch configured mergetool (i use `vimdiff`)
`git mergetool`

### Branch Management

View latest commit of each branch
`git branch -v`
`--merged` and `--no-merged` can be used to filter this

Rename branches (locally) (proceed with great caution, this might be integrated)
`git branch --move <old> <new>`

Push a local branch to an as of yet untracked upstream
`git push --set-upstream origin <new>`

Delete a remote branch as you would a tag
`git push origin --delete <old>`
