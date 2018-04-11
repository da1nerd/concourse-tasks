#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

npm ci
npm run load-apps
npm test
