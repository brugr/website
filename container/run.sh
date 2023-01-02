#!/bin/bash

cleanup ()
{
kill -s SIGTERM $!
exit 0
}

trap cleanup SIGINT SIGTERM

while [ 1 ]
do
    echo "script: Git pull"
    git pull
    git reset --hard origin/main
    echo "script: Hugo build"
    cd /site/src && hugo && cd /site
    echo "script: Sleeping for $SLEEP_TIME (SLEEP_TIME env)"
    sleep $SLEEP_TIME & wait
done