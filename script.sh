#!/bin/sh

cd "$GITHUB_WORKSPACE"

echo "$INPUT_PACKAGE_MANAGER"

# need to install dependencies
bundle

# check the dependencies
license_finder

