#!/bin/bash

set -xe

cd code-base/

npm install
npm run load-apps
npm test
