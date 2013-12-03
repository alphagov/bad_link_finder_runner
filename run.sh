#!/bin/bash
set -e
bundle install --path vendor/bundle
export MIRROR_DIR=`readlink /var/lib/govuk_mirror/current` 
export REPORT_OUTPUT_FILE="logs/`date +%Y-%m-%d_%H-%I-%S`-bad_link_report.csv"
export SITE_HOST="https://www.gov.uk"

mkdir -p logs
echo "Logging to $REPORT_OUTPUT_FILE"
bundle exec bad_link_finder
