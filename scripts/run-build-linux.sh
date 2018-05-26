#!/bin/bash

set -xe

FILE=translationCore-linux-x64-$VERSION-$HASH.zip

gulp build --linux || exit 1;
gulp release-linux --out=../build/linux/$FILE || exit 1;

echo "[Linux build $HASH (v$VERSION)](https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE) is ready for download." >> ../build_meta/comment.md
echo "<https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE|Linux build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt

cat ../build_meta/notification.txt
