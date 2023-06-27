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

license_finder

