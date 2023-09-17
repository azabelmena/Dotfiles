#!/bin/sh

speed=$(sensors | grep -i cpuf | awk '{print $2; exit}')

echo " $speed RPM"
