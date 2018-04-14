# Automatically start the X server on login
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi

# we want these main exports so things are themed correctly
export PATH=$PATH:$HOME/bin
export EDITOR='nvim'
export VISUAL=$EDITOR

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# configuration overrides to better match xdg specification
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/settings.ini"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

# Aliases for better .config conformance
export LESSHISTFILE=-

# prevent wine creating menu/desktop entries
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
