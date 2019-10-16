#!/bin/sh

echo "HOME"
ls "$HOME"

echo "GITHUB_WORKSPACE"
ls "$GITHUB_WORKSPACE"

echo "RUNNER_WORKSPACE"
ls "$RUNNER_WORKSPACE"

cd "$GITHUB_WORKSPACE"

pwd
ls -R

bundle

# moved to Dockerfile
#gem install license_finder

license_finder

