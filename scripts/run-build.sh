#!/bin/bash

set -xe

# copy input metadata to output
./concourse-tasks/scripts/copy-dir.sh input_meta build_meta

cd code-base/

HASH=$(git rev-parse HEAD | cut -c1-7)
VERSION=$(node -p -e "require('./package.json').version")

# TODO: it would be nicer to decrypt .env.enc instead
echo "TC_HELP_DESK_TOKEN=$TC_HELP_DESK_TOKEN" >> .env
echo "TC_HELP_DESK_EMAIL=$TC_HELP_DESK_EMAIL" >> .env
echo "BUILD=$HASH" >> .env

# execute the appropriate platform builder
HASH=$HASH VERSION=$VERSION ../concourse-tasks/scripts/run-build-$PLATFORM.sh
