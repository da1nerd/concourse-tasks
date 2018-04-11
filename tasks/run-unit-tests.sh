#!/bin/bash

set -xe

npm i -g npm@5.8.0

node --version
npm --version

cd code-base/

npm ci
npm run load-apps
npm test
