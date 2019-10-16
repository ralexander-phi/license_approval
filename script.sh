#!/bin/sh

cd "$GITHUB_WORKSPACE"

# need to install dependencies
bundle

# check the dependencies
license_finder

