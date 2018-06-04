#!/bin/bash

set -xe

cd code-base/

TEST_SCRIPT=./.concourse/test.sh

if [ -f $TEST_SCRIPT ]; then
  $TEST_SCRIPT
else
  npm test
fi
