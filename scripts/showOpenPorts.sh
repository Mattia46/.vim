#!/bin/bash
PORT=$1

if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Please type the Port number"
else
    RESULT=$(lsof -nP -iTCP:$1 | grep LISTEN | awk '{print $2}')
    if [[ -n $RESULT ]]; then
        echo "The port is running at PID: ${RESULT}"
        echo "Do you to kill it?"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) kill -9 ${RESULT}; break;;
                No ) exit;;
            esac
        done
    else echo "No ${PORT} port running"
    fi
fi
