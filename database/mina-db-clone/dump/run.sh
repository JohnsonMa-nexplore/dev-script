#!/bin/bash

current_date_time=$(date '+%d%m%y-%H%M')
case "$1" in
    cimic-prod)
        dumpName="prod-cimic-$current_date_time"
        jsonFile="cimic-prod.json"
        ;;
    ugl-prod)
        dumpName="prod-ugl-$current_date_time"
        jsonFile="ugl-prod.json"
        ;;
    *)
        echo "Usage: $0 [cimic-prod]"
        exit 1
        ;;
esac

cd "$(dirname "$0")"
echo "Cloning $dumpName on $1"
jq --arg dumpName "$dumpName" '.dumpName = $dumpName' $jsonFile | gh workflow run pg-dump.yml --json -R NexploreTechnology/e2ep-mina-utils



