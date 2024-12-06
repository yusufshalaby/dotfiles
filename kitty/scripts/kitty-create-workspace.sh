#!/bin/bash

# Get the list of existing wm_names
existing_names=$(kitty @ls | /opt/homebrew/bin/jq -r '.[].wm_name')

while true; do
    # Prompt the user for a workspace name
    read -p "Enter workspace name: " workspace_name

    # Check if the entered name matches any existing wm_name
    if echo "$existing_names" | grep -qx "$workspace_name"; then
        echo "A workspace with the name '$workspace_name' already exists. Please choose another name."
    elif [[ -z $workspace_name ]]; then
        echo "Workspace name cannot be empty. Please enter a valid name."
    else
        break
    fi
done

# Launch a new Kitty OS window with the specified name
kitten @ launch --type os-window --os-window-name "$workspace_name"
