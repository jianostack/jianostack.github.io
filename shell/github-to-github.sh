#!/bin/bash

echo
echo "-----------------------------"
echo "Github account to Github account migration"
echo "-----------------------------"
echo

count=0

function printUsage() {
        echo "The script '$0' requires:"
        echo ' - Two arguments 1) txt file with a list of repositories names 2) Destination Github account'
        echo ' - Must be run in the directory with all the cloned repositories'
        echo ' ' 
}

function migrate() {
    while read -u 9 LINE; do
        gh repo create $2/$LINE --private
        
        let count++
        echo "Cloning repo $LINE on line $count"

        cd $LINE

        echo "[remote \"$2\"]
        url = git@github.com:$2/$LINE.git
        fetch = +refs/heads/*:refs/remotes/origin/*" >> .git/config 

        if ! git push --all $2; then echo "command failed git push"; exit 1; fi

        cd ..
    done 9< $1
}

if [ $# -le 0 ]
then
    printUsage
else
    migrate $*
fi
