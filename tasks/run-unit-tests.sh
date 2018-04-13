#!/bin/bash

set -xe

cd code-base/

node --version
npm --version

npm install
npm test
