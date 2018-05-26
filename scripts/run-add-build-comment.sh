#!/bin/bash

set -xe

if [ -f build_meta/notification.txt ]; then
  cat build_meta/notification.txt
fi

echo $text >> build_meta/comment.md
echo $text >> build_meta/notification.txt

cat build_meta/notification.txt
