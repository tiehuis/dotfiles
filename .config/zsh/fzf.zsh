# Setup fzf
# ---------
if [[ ! "$PATH" == */home/me/.local/share/fzf/bin* ]]; then
  export PATH="$PATH:/home/me/.local/share/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/me/.local/share/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/me/.local/share/fzf/shell/key-bindings.zsh"

