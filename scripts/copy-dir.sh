#!/bin/bash

# This script safely copies the contents of one directory to another

set -xe

if [ "$#" -ne 2 ]; then
  echo "Illegal number of parameters. Requires source dir and dest dir";
  exit 1;
fi

if [ -d "$1" ]; then
  cp -a $1/* $2/
fi
