#!/bin/bash

# Get the list of existing wm_names
existing_names=$(kitty @ls | /opt/homebrew/bin/jq -r '.[].wm_name')

while true; do
    # Prompt the user for a workspace name
    read -p "Enter new workspace name: " workspace_name

    # Check if the entered name matches any existing wm_name
    if echo "$existing_names" | grep -qx "$workspace_name"; then
        echo "A workspace with the name '$workspace_name' already exists. Please choose another name."
    elif [[ -z $workspace_name ]]; then
        echo "Workspace name cannot be empty. Please enter a valid name."
    else
        break
    fi
done

curr_focused_window=$(kitty @ls | /opt/homebrew/bin/jq -r '.[] | select(.is_focused).tabs[] | select(.is_focused).windows[] | select(.is_focused).id')
prev_name=$(kitty @ls | /opt/homebrew/bin/jq -r '.[] | select(.is_focused).wm_name')

# Launch a new Kitty OS window with the specified name
kitten @ launch --type os-window --os-window-name "$workspace_name"

curr_workspace_tab_id=$(kitty @ls | /opt/homebrew/bin/jq --arg name "$workspace_name" -r '.[] | first(select(.wm_name==$name).tabs[].id)')

for tab in $(kitty @ls | /opt/homebrew/bin/jq --arg name "$prev_name" -r '.[] | select(.wm_name==$name).tabs.[].id'); do
    echo "Detaching tab $tab and attaching it to workspace with tab $curr_workspace_tab_id"
    kitten @ detach-tab -m id:$tab -t id:$curr_workspace_tab_id
done

kitten @ close-tab -m id:$curr_workspace_tab_id
kitten @ focus-window -m id:$curr_focused_window
