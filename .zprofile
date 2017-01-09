# Automatically start the X server on login
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi

# we want exports so things like gtk2 are themed correctly
source .config/zsh/export.zsh
