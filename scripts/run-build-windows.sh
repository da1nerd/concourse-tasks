#!/bin/bash

set -xe

FILE64=translationCore-win-x64-$VERSION-$HASH.setup.exe
FILE32=translationCore-win-x32-$VERSION-$HASH.setup.exe

./node_modules/.bin/gulp build --win || exit 1;
ls -la out
./node_modules/.bin/gulp release-win64 --out=../build/windows/x64/$FILE64 || exit 1;
./node_modules/.bin/gulp release-win32 --out=../build/windows/x32/$FILE32 || exit 1;

# x64
echo "[Windows build $HASH (v$VERSION)](https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE64) is ready for download." >> ../build_meta/comment.md
echo "<https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE64|Windows x64 build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
# x32
echo "[Windows build $HASH (v$VERSION)](https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE32) is ready for download." >> ../build_meta/comment.md
echo "<https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE32|Windows x32 build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
