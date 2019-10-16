#!/bin/sh

cd "$GITHUB_WORKSPACE"

pwd
ls -R

bundle

# moved to Dockerfile
#gem install license_finder

license_finder

