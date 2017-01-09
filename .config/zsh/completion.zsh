autoload -Uz compinit
compinit

# allow completion from within the middle of a word
setopt COMPLETE_IN_WORD

# allow arrows on auto-completion menus
zstyle ':completion:*' menu select

# automatically reload for any new packages
zstyle ':completion:*' rehash true

# allow case insensitive auto-completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
