#!/bin/sh

cd "$GITHUB_WORKSPACE"
REPORT=$(license_finder report --format json)

echo ::set-output name=license_report_json::$REPORT
