

echo
echo "-----------------------------"
echo "Bitbucket to Github migration"
echo "-----------------------------"
echo

count=0

function printUsage() {
        echo "The script '$0' requires two arguments:"
        echo ' - txt file with a list of repositories names'
        echo ' - Bitbucket username or organisation'
        echo ' - Github username or organisation'
}

function migrate() {
    while read -u 9 LINE; do
        gh repo create $3/$LINE --private
        
        let count++
        echo "Cloning repo $LINE on line $count"

        if ! git clone git@bitbucket.org:$2/$LINE.git; then echo "command failed git clone"; exit 1; fi 

        cd $LINE

        git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done

        git fetch --all

        git pull --all

        echo "[remote \"github\"]
        url = git@github.com:$3/$LINE.git
        fetch = +refs/heads/*:refs/remotes/origin/*" >> .git/config

        if ! git push --all github; then echo "command failed git push"; exit 1; fi

        cd ..
    done 9< $1
}

if [ $# -le 0 ]
then
    printUsage
else
    migrate $*
fi
