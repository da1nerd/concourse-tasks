#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

npm install surge -g

# TODO: surge it!
echo "running surge...";
