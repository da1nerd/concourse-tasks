#!/bin/bash

set -xe

node --version
npm --version

cd code-base/

npm ci
npm run load-apps
npm test
