#!/bin/bash

set -xe

cd code-base/

npm test
codecov 
