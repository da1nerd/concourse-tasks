#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

npm install
npm test

echo "Concourse just ran all your tests! Woohoo!" > ../test-log/comment.md
