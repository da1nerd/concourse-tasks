#!/bin/bash

set -xe

cd code-base/

npm ci
npm run load-apps
npm test
