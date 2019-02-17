#!/bin/bash

set -o errexit
set -o nounset

config_file="${1}"

while read line; do
    title="$(echo "${line}" | cut -d":" -f1)"
    username="$(echo "${line}" | cut -d":" -f2)"
    password="$(echo "${line}" | cut -d":" -f3)"

    echo "${title}"
    echo "${title}" | sed -E 's/./=/g'
    KOGANMOBILE_USERNAME="${username}" KOGANMOBILE_PASSWORD="${password}" python km-scrape-usage.py
    echo

done < "${config_file}"
