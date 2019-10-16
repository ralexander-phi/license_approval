#!/bin/sh

cd "$GITHUB_WORKSPACE"

pwd
ls -R

bundle

gem install license_finder

license_finder

