#!/bin/bash

source ./colors.sh

echo 'Here'
cd ~/.vim/scripts; ./updateNotes.sh
tmux new-session -s mattia
cd ~/DAZN/common-web-bootstrap-dazn


