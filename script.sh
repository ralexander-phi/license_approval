#!/bin/sh

# Run the tool
cd "$GITHUB_WORKSPACE"

echo "Gemfile"
cat Gemfile

echo "Gemfile.lock"
cat Gemfile.lock

REPORT=$(license_finder report --format json)
if [ "$?" -ne 0 ]; then
    echo "Could not run the report tool!"
	echo "$REPORT"
	exit 1
fi

# minimize the JSON
REPORT=$(echo $REPORT | jq -c)

# set it for Github Actions to read as an output
echo "::set-output name=license_report_json::$REPORT"
