#!/bin/sh

cd "$GITHUB_WORKSPACE"
REPORT=$(license_finder report --format json | jq -c)

echo ::set-output name=license_report_json::$REPORT
