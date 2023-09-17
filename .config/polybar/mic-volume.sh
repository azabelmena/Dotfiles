#!/bin/bash

SOURCE=$(pactl get-default-source)
STATUS=$(pamixer --source $SOURCE --get-mute)

if $STATUS; then
    echo ""
else
   echo ""
fi
