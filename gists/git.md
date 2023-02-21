## migrate large files to git lfs

```
git lfs migrate info
git lfs migrate import
```

## remove that large file from history

`git filter-branch --tree-filter 'rm -f DVD-rip' HEAD --all`

## file history

`git log --follow -p path-to-file `


## pull and push all branches to new remote

Do this on a fresh clone:

```
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
git pull --all
git push --all github
```

## git log
`git log --oneline --graph --all`

## remove remote branch

`git push <remote> --delete <branch>`

`git fetch -p`


## Merge conflicts
git mergetool

## Stage and unstaged changes
git diff HEAD

## Show changes between two commits
git diff commit1 commit2

## List the change dates and authors for a file
git blame [file]

## List all branches verbose
`git branch -av`

## Switch branch
`git checkout my_branch`

## pre-commit script

```
#!/bin/sh

GZIP=/Users/homeuser/Sites/project/wp-content/mysql/mysql.gz

mysqldump -uroot -proot fcfer_dev | /usr/bin/gzip > $GZIP
git add $GZIP
```

## pre-commit
`chmod a+x pre-commit`

## Amend commit message
`git commit --amend`
 
## revert a file
git checkout [commit ID] -- path/to/file

## files changed in a commit
`git show --name-only [commit]`

## commit line break
`git commit -m "My head line" -m "My content line."`

## reset one file
`git checkout -- package-lock.json`

