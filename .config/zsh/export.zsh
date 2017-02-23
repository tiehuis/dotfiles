export PATH=$PATH:~/bin
export EDITOR='nvim'

# Aliases for better .config conformance
export LESSHISTFILE=-

export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share

# configuration overrides to better match xdg specification
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/settings.ini
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"

# prevent wine creating menu/desktop entries
export WINEDLLOVERRIDES="winemenubuilder.exe=d"

# speed up fzf performance with ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow \
                                --glob "!.git/*"'
