#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

npm install
npm run load-apps
gulp build --linux || exit 1;
gulp release --linux || exit 1;

# copy into output
cp -a release/. ../build/
