#!/bin/sh

xrdb -load ~/.Xresources
~/bin/./nvfancontrol -f &
urxvtd -q -f -o
xset -b
exec i3
