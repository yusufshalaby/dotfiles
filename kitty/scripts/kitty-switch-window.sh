#!/bin/bash

# Debugging: Log the start of the script
# echo "Script started."

# Prevent premature exit if `fzf` fails or no selection is made
available_windows=$(kitty @ls | /opt/homebrew/bin/jq -r '.[] | select(.is_focused|not).wm_name')
if [[ -z $available_windows ]]; then
    echo "No other windows available."
    read -p "Press enter to exit..."
    exit
fi

# Check the number of available windows
window_count=$(echo "$available_windows" | wc -l | tr -d ' ')

if [[ $window_count -eq 1 ]]; then
    wm_name=$available_windows
else
    # Use fzf if there are multiple windows
    wm_name=$(echo "$available_windows" | /opt/homebrew/bin/fzf --height 20% --reverse)
    if [[ -z $wm_name ]]; then
        # echo "No window name selected."
        # read -p "Press enter to exit..."
        exit
    fi
fi

# Call the window-switching logic
# echo "Calling kitty-active-window.sh with wm_name: $wm_name"  # Debugging: Log the script call
id=$(~/.config/kitty/scripts/kitty-active-window.sh "$wm_name")
# echo "Returned id: $id"  # Debugging: Log the returned ID
# For debugging: Pause the script to see the output
# sleep 10
if [[ -n $id ]]; then
    # echo "Focusing window with id: $id"  # Debugging: Log the focus action
    /Applications/kitty.app/Contents/MacOS/kitten @focus-window -m id:$id
else
    # echo "No valid window ID found. Exiting..."  # Debugging: Log invalid ID
    read -p "No window selected. Press Enter to exit..."
fi
