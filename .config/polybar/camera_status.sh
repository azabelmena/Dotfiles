#!/bin/sh

if xinput --list-props 12 | grep "Device Enabled (189):	0" >/dev/null
then
    echo "﫞"
else
    echo ""
fi
