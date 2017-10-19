# zplug specific
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "chrissicool/zsh-256color"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "tiehuis/zig-compiler-completions", use:"completions/_zig", defer:2

zplug load
