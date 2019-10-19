#!/bin/sh

cd "$GITHUB_WORKSPACE"

if [ -f Gemfile.lock ]; then
	# Install matching bundler version for max compatibility
	BUNDLER_VERSION=$(cat Gemfile.lock | grep -A 1 "BUNDLED WITH" | egrep "^\s+[0-9]+(\.[0-9]+)*$")
	if [ "$?" -eq 0 ]; then
		echo "Installing bundler version $BUNDLER_VERSION, to match Gemfile.lock"
		gem install bundler -v $BUNDLER_VERSION
		if [ "$?" -ne 0 ]; then
			echo "Failed to install matching bundler version."
			echo "Trying with inconsistent bundler version anyway."
		fi
	fi
fi

# Make sure dependencies are installed
bundle install
if [ "$?" -ne 0 ]; then
	echo "Failed to install dependencies"
	echo "Try to pre-install these before calling this action"
	exit 1
fi

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

