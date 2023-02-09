#!/bin/bash


if [[ ( ! -z "$VERSION" ) || ( -f "./package.json" ) ]]
      then
      VERSION=`jq -r '.version' package.json`
fi

set +x
