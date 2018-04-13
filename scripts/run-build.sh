#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

npm install
npm run build

# copy into output
cp -a dist/. ../build/
