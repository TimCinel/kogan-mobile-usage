#!/bin/bash

set -o errexit
set -o nounset

config_file="${1}"

while read line; do
    alias="$(echo "${line}" | cut -d":" -f1)"
    username="$(echo "${line}" | cut -d":" -f2)"
    password="$(echo "${line}" | cut -d":" -f3)"

    KOGANMOBILE_ALIAS="${alias}" KOGANMOBILE_USERNAME="${username}" KOGANMOBILE_PASSWORD="${password}" python km-scrape-usage.py

done < "${config_file}"
