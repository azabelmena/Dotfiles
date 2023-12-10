#!/bin/sh

icon_intel="﬙ Intel"
icon_nvidia="﬙ Nvidia"
icon_hybrid="﬙ Hybrid"
hybrid_switching=0


gpu_current() {
	mode=$(optimus-manager --print-mode)

    echo "$mode" | cut -d ' ' -f 5 | tr -d '[:space:]'
}

gpu_display(){
    mode=$(gpu_current)

    if [ "$mode" = "integrated" ]; then
		echo "$icon_intel"
	elif [ "$mode" = "nvidia" ]; then
		echo "$icon_nvidia"
	elif [ "$mode" = "hybrid" ]; then
		echo "$icon_hybrid"
	fi
}

gpu_display
