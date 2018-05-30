#!/bin/bash

set -xe

# copy input metadata to output
./concourse-tasks/scripts/copy-dir.sh input_meta build_meta

cd code-base/

HASH=$(git rev-parse HEAD | cut -c1-7)
VERSION=$(node -p -e "require('./package.json').version")

# TODO: decrypt .env

echo "BULID=$HASH" >> .env

# execute the appropriate platform builder
HASH=$HASH VERSION=$VERSION ../concourse-tasks/scripts/run-build-$PLATFORM.sh
