#!/bin/sh

cd "$GITHUB_WORKSPACE"

# Install matching bundler version for max compatibility
BUNDLER_VERSION=$(cat Gemfile.lock | grep -A 1 "BUNDLED WITH" | egrep "^\s+[0-9]+(\.[0-9]+)*$")
gem install bundler -v $BUNDLER_VERSION

# Make sure dependencies are installed
bundle install

#
# Run the tool
#
# This inspects all the dependencies, and determines their version and licenses
# JSON output is used for further steps to consume
#
REPORT=$(license_finder report --format json)
if [ "$?" -ne 0 ]; then
    echo "Could not run the report tool!"
	echo "$REPORT"
	exit 1
fi

#
# Minimize JSON
#
# Remove all output until the start of the JSON (I.E. "{" char)
#    license_finder can be chatty
# Base64 is used to ensure we don't have issues with special characters
# Condense to a single line
#
REPORT=$(echo $REPORT | sed 's/[^{]*{/{/' | base64 | tr -d '\n')

# Special output for Github Actions to read the value
echo "##[set-output name=license_report_json;]$REPORT"

