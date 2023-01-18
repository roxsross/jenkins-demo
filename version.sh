#!/bin/bash

if [[ ( ! -z "$VERSION" ) || ( -f "./package.json" ) ]]
      then
      export VERSION=`jq -r '.version' package.json`
fi

