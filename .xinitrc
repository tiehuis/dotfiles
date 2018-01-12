#!/bin/sh

xrdb -load ~/.Xresources
sh ~/.fehbg &
~/bin/./nvfancontrol -f &
xset -b
exec i3
