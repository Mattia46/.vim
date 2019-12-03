#!/bin/bash

source ./colors.sh

echo 'Starting the new session'
tmux kill-server
#cd ~/.vim/scripts; ./updateNotes.sh
tmux new-session -d

createWindowTarget() {
    tmux new-window
    tmux rename-window $1
    cd ~/DAZN/$1-bootstrap-dazn
}

createWindowModule() {
    tmux new-window
    tmux rename-window $1
    cd ~/DAZN/$1
}

startServer() {
    tmux new-window
    tmux rename-window $1
    #cd ~/DAZN/common-web-bootstrap-module
}


createWindowTarget 'common-web'
createWindowTarget 'common-tv'
createWindowModule 'bootstrap-modules'
startServer 'server'
tmux -2 attach-session -d
echo 'Completed'


