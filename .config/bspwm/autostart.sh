#!/bin/bash

startxfce4 &

if pgrep -x "xfwm4" > /dev/null
then
	killall xfwm4
fi


sxhkd &
picom &

#Other application can be added here to autostart
