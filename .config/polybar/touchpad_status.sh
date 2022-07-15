#!/bin/sh

if xinput --list-props "Synaptics TM3336-004" | grep "Device Enabled (189):	0" >/dev/null
then
    echo -e ""
else
    echo -e ""
fi
