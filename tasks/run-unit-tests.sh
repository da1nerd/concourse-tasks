#!/bin/bash

set -xe

cd code-base/

node --version
npm i npm@5.8.0

npm ci
npm run load-apps
npm test
