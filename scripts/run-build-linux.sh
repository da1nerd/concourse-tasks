#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

HASH=$(git rev-parse HEAD | cut -c1-7)
echo $HASH > ../build_meta/commit.txt
VERSION=$(node -p -e "require('./package.json').version")
echo $VERSION > ../build_meta/version.txt
FILE=translationCore-linux-x64-$VERSION-$HASH.zip
echo $FILE > ../build_meta/filename.txt
MESSAGE="[Linux build $HASH (v$VERSION)](https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE) is ready for download."

npm install
npm install -g gulp@4.0.0
npm run load-apps
gulp build --linux || exit 1;
gulp release-linux --out=../build/linux/$FILE || exit 1;

echo $MESSAGE > ../build_meta/comment.md
