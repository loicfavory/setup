#!/bin/sh
i3-msg -t subscribe -m '["workspace", "output"]' | {
    i3-msg -t get_workspaces;
    while read EVENT; do i3-msg -t get_workspaces; done;
} | jq --unbuffered -c '[ .[] | select(.visible == false or .visible == true) ]'
