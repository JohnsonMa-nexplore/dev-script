#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Restore a dump on a development namespace"
    echo "Usage: $0 <namespace> <dumpName>"
    exit 1
fi

namespace=$1
dumpName=$2

cd "$(dirname "$0")"
echo "Restoring $2 on $1"
jq --arg namespace "$namespace" --arg dumpName "$dumpName" '.namespace = $namespace | .dumpName = $dumpName' ./dev.json | gh workflow run pg-restore.yml --json -R NexploreTechnology/e2ep-mina-utils



