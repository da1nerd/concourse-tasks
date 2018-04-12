#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

npm i -g gulp

npm ci
npm run load-apps
gulp build --linux
