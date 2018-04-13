#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

npm install
npm test

echo "Woohoo! The tests pass!" > ../test-log/comment.txt
