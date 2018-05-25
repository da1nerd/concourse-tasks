#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

HASH=$(git rev-parse HEAD | cut -c1-7)
# echo $HASH > ../build_meta/commit.txt
VERSION=$(node -p -e "require('./package.json').version")
# echo $VERSION > ../build_meta/version.txt
FILE64=translationCore-win-x64-$VERSION-$HASH.setup.exe
FILE32=translationCore-win-x32-$VERSION-$HASH.setup.exe
# echo $FILE > ../build_meta/filename.txt
#
npm install
npm install -g gulp@4.0.0
npm run load-apps
gulp build --win || exit 1;
gulp release-win64 --out=../build/windows/x64/$FILE64 || exit 1;
gulp release-win32 --out=../build/windows/x32/$FILE32 || exit 1;

# x64
echo "[Windows build $HASH (v$VERSION)](https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE64) is ready for download." >> ../build_meta/comment.md
echo "<https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE64|Windows x64 build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
# x32
echo "[Windows build $HASH (v$VERSION)](https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE32) is ready for download." >> ../build_meta/comment.md
echo "<https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE32|Windows x32 build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
