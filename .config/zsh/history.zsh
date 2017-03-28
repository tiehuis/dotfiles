# don't add commands with leading spaces to history
setopt HIST_IGNORE_SPACE

# don't display duplicates in line editor
setopt HIST_FIND_NO_DUPS

# don't display consecutive duplicates in history
setopt HIST_IGNORE_DUPS

# don't display history command in history
setopt HIST_NO_STORE

# don't add superfluous spaces to history
setopt HIST_REDUCE_BLANKS

# ensure we have sufficient history, the directory to this must be created
# manually!
export HISTFILE=~/.cache/zsh/history
export SAVEHIST=1000
export HISTSIZE=$SAVEHIST
