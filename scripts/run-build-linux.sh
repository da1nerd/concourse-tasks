#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

HASH=$(git rev-parse HEAD | cut -c1-7)
# echo $HASH > ../commit.txt
VERSION=$(node -p -e "require('./package.json').version")
# echo $VERSION > ../version.txt

npm install
npm install -g gulp@4.0.0
npm run load-apps
gulp build --linux || exit 1;
gulp release-linux --out=../build/linux/translationCore-linux-x64-$VERSION-$HASH.zip || exit 1;
