#!/bin/bash
wm_name=$1
if [[ -z $wm_name ]]; then
    exit 1
fi

window_id=$(kitty @ls | /opt/homebrew/bin/jq --arg wm_name "$wm_name" '
    first(.[] | select(.wm_name == $wm_name)).tabs[]
    | select(.is_active).windows[]
    | select(.is_active).id
')

if [[ -n $window_id ]]; then
    echo "$window_id"
else
    echo "No active window found for wm_name: $wm_name"
    exit 1
fi
