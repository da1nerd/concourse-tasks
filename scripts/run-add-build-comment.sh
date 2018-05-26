#!/bin/bash

set -xe

if [ -f build_meta/notification.txt ]; then
  cat build_meta/notification.txt
fi

# copy previous values
cp meta/comment.md build_meta/comment.md
cp meta/notification.txt build_meta/notification.txt

# append new values
echo $text >> build_meta/comment.md
echo $text >> build_meta/notification.txt

cat build_meta/notification.txt
