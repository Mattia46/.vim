#!/bin/bash

source ./colors.sh

echo 'Starting the new session'
tmux kill-session -a
cd ~/.vim/scripts; ./updateNotes.sh
tmux new-session -s mattia;

createWindowTarget() {
    echo `creating a window $1`
    tmux new-window
    tmux rename-window $1
    echo `DAZN/$1-bootstrap-dazn`
}

createWindowModule() {
    echo `creating a window $1`
    tmux new-window
    tmux rename-window $1
    #cd ~/DAZN/$1
}

startServer() {
    echo `starting server`
    tmux new-window
    tmux rename-window $1
    #cd ~/DAZN/common-web-bootstrap-module
}

#createWindowTarget 'common-web'
#createWindowTarget 'common-tv'
#createWindowModule 'bootstrap-modules'
#startServer 'server'

echo 'Completed'


