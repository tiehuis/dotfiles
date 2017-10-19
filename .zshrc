PX=~/.config/zsh

source $PX/export.zsh       # Must be first
source $PX/function.zsh     # Must be second
source $PX/completion.zsh
source $PX/alias.zsh
source $PX/bindkey.zsh
source $PX/general.zsh
source $PX/history.zsh
source $PX/lang.zsh
source $PX/prompt.zsh
source $PX/zplug.zsh

# Ensure custom completion scripts loaded anywhere are respected
autoload -U compinit
compinit
