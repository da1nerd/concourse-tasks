#!/bin/bash

set -xe

cat build_meta/notification.txt

echo $text >> build_meta/comment.md
echo $text >> build_meta/notification.txt

cat build_meta/notification.txt
