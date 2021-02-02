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
`git log --stat --graph --all`

## remove remote branch

`git push <remote> --delete <branch>`

`git fetch -p`

## reset a file
git checkout filename

## Merge conflicts
git mergetool

## Stage and unstaged changes
git diff HEAD

## Show changes between two commits
git diff commit1 commit2

## List the change dates and authors for a file
git blame [file]

## List all branches verbose
git branch -av

## Switch branch
git checkout my_branch

## Merge branch_a into branch_b
git fetch --all

git checkout branch_a

git merge branch_b

## pre-commit script

```
#!/bin/sh

GZIP=/Users/homeuser/Sites/project/wp-content/mysql/mysql.gz

mysqldump -uroot -proot fcfer_dev | /usr/bin/gzip > $GZIP
git add $GZIP
``` 

## pre-commit
`chmod a+x pre-commit`


## force merge
I don’t care if there is any other conflict. My branch A will win. Always

```
git checkout A
git merge -s ours master
git checkout master
git merge A
```

## Amend commit message
`git commit --amend`

