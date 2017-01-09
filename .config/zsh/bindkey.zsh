zmodload zsh/terminfo

# bindings for history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "$terminfo[khome]" beginning-of-line
bindkey "$terminfo[kend]"  end-of-line
