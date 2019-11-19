#!/bin/bash

source ./colors.sh

updateRepo() {
    cd $1
    LAST=$(pwd | sed 's/\/home\/mattia\///g')
    echo $YELLOW $LAST $Color_Off
    STAGED=$(git diff --name-only --cached)
    UNSTAGED=$(git ls-files -o -m)
    if [[ -z $STAGED ]] && [[ -z $UNSTAGED ]]; then
        echo "$Green Working tree clean "
        echo ""
        echo " Updating with remote $Color_Off"
        git pull origin master
    else
        echo "$Red Unstaged files $Color_Off"
        echo $UNSTAGED | sed 's/\ /\n/g'
        echo '-----'
        echo "$Yellow Staged files $Color_Off"
        echo $STAGED | sed 's/\ /\n/g'
        echo "Do you want to commit them?"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) echo "Commit message?";
                      read line;
                      git add .;
                      git commit -m "$line";
                      git pull origin master
                      git push origin master
                      break;;
                No ) exit;;
            esac
        done
    fi
}
updateRepo ~/.Notes
updateRepo ~/.vim
