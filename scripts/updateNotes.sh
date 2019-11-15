#!/bin/bash

COMMIT_MESSAGE=$1
cd ~/.Notes
echo "Staging files"
git add .
echo "commit message: $1"
git commit -m $1
git push origin master
