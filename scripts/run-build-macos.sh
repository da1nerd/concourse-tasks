#!/bin/bash

set -xe

FILE=translationCore-macos-x64-$VERSION-$HASH.dmg

gulp build --osx || exit 1;
gulp release-macos --out=../build/macos/$FILE || exit 1;

echo "[macOS build $HASH (v$VERSION)](https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE) is ready for download." >> ../build_meta/comment.md
echo "<https://s3-us-west-2.amazonaws.com/tc-builds.door43.org/$FILE|macOS build $HASH (v$VERSION)> is ready for download." >> ../build_meta/notification.txt
