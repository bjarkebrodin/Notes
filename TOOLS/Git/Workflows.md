# Git Workflows 

Many strategies revolve around several tiers of stability,
the idea is that basically we have a 'stable'-tier branch; 
usually `main`, `master`, `production` or `release`. 
A development/proposed/???-tier and topical branches for 
hotfixes or features.

### Topic Branches

Creating, deleting and switching branches is very efficient 
in git enabling the use of branching to allow for rapid 
context switching.

### Distributed git

Checkout a new branch starting from a remote branch
`git checkout -b <newbranch> <remote>/<remotebranch>`

Set tracked upstream branch
`git branch -u <remote>/<remotebranch>`

See tracked branches 
`git branch -vv`

Fetch everything held in remotes
`git fetch --all`

### Rebasing

Rebase all changes from current branch onto target branch,
that is: apply all patches since common ancestor, but after 
the head of target instead.
`git rebase <target>`

Rebasing gives a somewhat cleaner history, and can be useful
for checking whether a branch can be cleanly merged into a 
different branch (versus checking from the branch were merging into)

In case of someone rebasing the commits you depend on, make
sure to rebase to the new head and NOT `merge`, this will 
make things slightly smoother. `git pull --rebase` can be 
useful for this.

Rebasing commits that are only existing locally however, should
always be fine - because problems only arise if we get conflicting
server histories or if we depend on commmits that others then 
rebase after we have commited on top of them.

TL;DR >> rebase local changes to clean up your local history 
      << never rebase anything that has already been pushed
