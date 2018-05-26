#!/bin/bash

set -xe

# copy input to output
if [ -d meta ]; then
  cp -a meta/* build_meta/
fi

# see input
if [ -f build_meta/notification.txt ]; then
  cat build_meta/notification.txt
fi

# append new values
echo $text >> build_meta/comment.md
echo $text >> build_meta/notification.txt

cat build_meta/notification.txt
