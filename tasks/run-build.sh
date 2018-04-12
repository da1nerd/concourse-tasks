#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

npm i -g gulp@4.0.0

npm ci
npm run load-apps
gulp build --linux
