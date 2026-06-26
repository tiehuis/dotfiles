#!/bin/sh

xset -b
xrandr --output DP-2 --mode 2560x1440 --rate 143.91
dunst &
export XDG_SESSION_TYPE=x11
export NVD_BACKEND=direct
export MOZ_DISABLE_RDD_SANDBOX=1
export LIBVA_DRIVER_NAME=nvidia
exec i3
