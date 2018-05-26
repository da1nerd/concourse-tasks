#!/bin/bash

set -xe

# copy input to output
if [ -d input_meta ]; then
  cp -a input_meta/* output_meta/
fi

# append new values
echo $text >> output_meta/comment.md
echo $text >> output_meta/notification.txt
