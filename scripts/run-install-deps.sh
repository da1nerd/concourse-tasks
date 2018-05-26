#!/bin/bash

set -xe

# copy input to output
./concourse-tasks/scripts/copy-dir.sh code-base code-with-dependencies

cd code-with-dependencies/

node --version
npm --version

npm ci
npm run load-apps
npm install -g gulp@4.0.0
