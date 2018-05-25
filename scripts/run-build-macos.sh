#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

HASH=$(git rev-parse HEAD | cut -c1-7)
# echo $HASH > ../build_meta/commit.txt
VERSION=$(node -p -e "require('./package.json').version")
# echo $VERSION > ../build_meta/version.txt
FILE=translationCore-macos-x64-$VERSION-$HASH.dmg
# echo $FILE > ../build_meta/filename.txt
#
npm install
npm install -g gulp@4.0.0
npm run load-apps
gulp build --osx || exit 1;
gulp release-macos --out=../build/macos/$FILE || exit 1;

echo "[macOS build $HASH (v$VERSION)](https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE) is ready for download." >> ../build_meta/comment.md
echo "<https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE|macOS build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
