#!/bin/bash

if [ -z "$VERSION" ]
      then
      VERSION=`jq -r '.version' ./package.json`
      
fi

set +x

