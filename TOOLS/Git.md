# Git

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

Inverse of add (remove cached flag if you want to delete as well)
`git rm --cached <files>`
`git rm -rf --cached <files`

Commit staged changes to repository
`git commit`
`git commit -m`

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

Other useful options include `--since` `--until` `--author` `--committer`
`git log --since=2.weeks -- path/to/file`


