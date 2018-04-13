#!/bin/bash

set -xe

node --version
npm --version

npm install surge -g

cd release

# TODO: surge it!
echo "running surge...";
