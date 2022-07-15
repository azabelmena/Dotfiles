#!/bin/sh

if $(pamixer --source alsa_input.pci-0000_00_1f.3.analog-stereo --get-mute); then
    echo ""
else
    echo ""
fi
