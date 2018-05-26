#!/bin/bash

set -xe

# copy input to output
./concourse-tasks/scripts/copy-dir.sh input_meta build_meta

# append new values
echo $text >> build_meta/comment.md
echo $text >> build_meta/notification.txt
