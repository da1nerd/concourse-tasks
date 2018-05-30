#!/bin/bash

set -xe

FILE=translationCore-linux-x64-$VERSION-$HASH.zip

./node_modules/.bin/gulp build --linux || exit 1;
./node_modules/.bin/gulp release-linux --out=../build/linux/$FILE || exit 1;

echo "[Linux build $VERSION ($HASH)](https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE) is ready for download." >> ../build_meta/comment.md
echo "<https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE|Linux build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
