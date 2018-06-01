# exports
    export PATH=$PATH:$HOME/bin
    export EDITOR='nvim'
    export VISUAL=$EDITOR

    export XDG_CACHE_HOME=$HOME/.cache
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_DATA_HOME=$HOME/.local/share

    # configuration overrides to better match xdg specification
    export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
    export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
    export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
    export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
    export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

    # Aliases for better .config conformance
    export LESSHISTFILE=-

    # prevent wine creating menu/desktop entries
    export WINEDLLOVERRIDES="winemenubuilder.exe=d"

    # speed up fzf performance with ripgrep
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow \
                                    --glob "!.git/*"'


# functions
    fzf-open-file-or-dir() {
        local cmd="command find -L . \
            \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
            -o -type f -print \
            -o -type d -print \
            -o -type l -print 2> /dev/null | sed 1d | \cut -b3-"
        local out=$(eval $cmd | fzf-tmux --exit-0)

        if [ -f "$out" ]; then
            $EDITOR "$out" < /dev/tty
        elif [ -d "$out" ]; then
            cd "$out"
            zle reset-prompt
        fi
    }

    swap() {
        local tmpfile=tmp.$$
        mv "$1" "$tmpfile" && mv "$2" "$1" && mv "$tmpfile" "$2"
    }


# completion
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


# alias
    # generic
    alias apt='sudo apt'
    alias pacman='sudo pacman'
    alias g='git'
    alias ls='ls --color=auto --group-directories-first'
    alias feh='feh --image-bg black'
    alias vim='nvim'
    alias tree='tree -L 2 --noreport'

    # mpv offshoots
    alias mpi='mpv -profile image'
    alias mpa='mpv -profile music'

    # recorder
    alias deskrec='ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libvpx -qp 0 -preset ultrafast capture.webm'

    # manage configuration
    alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# bindkey
    zmodload zsh/terminfo

    # bindings for history-substring-search
    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down
    bindkey "$terminfo[khome]" beginning-of-line
    bindkey "$terminfo[kend]"  end-of-line
    bindkey "$terminfo[kdch1]" delete-char

    # bindings for fzf
    zle -N fzf-open-file-or-dir
    bindkey '^P' fzf-open-file-or-dir


# general
    setopt NO_BEEP
    setopt INTERACTIVE_COMMENTS
    setopt CORRECT


# history
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


# language-specific
    # Python
    export PATH=$PATH:~/.local/bin

    # Rust
    export PATH=$PATH:~/.local/share/cargo/bin
    export CARGO_HOME=~/.local/share/cargo
    export RUSTUP_HOME=~/.local/share/rustup
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

    # Go
    export GOPATH=~/.go
    export PATH=$PATH:~/.go/bin

    # Ruby
    export PATH=$PATH:~/.gem/ruby/2.4.0/bin

    # Js
    export PATH=$PATH:~/.local/share/npm/bin

    # zig
    export PATH=$PATH:~/local/bin


# prompt
    precmd() { _ps1_simple_git_prompt; }

    # A simple PS1 which also highlights the bad error codes
    _ps1_simple_error_prompt() {
        if [[ $? == 0 ]]; then
            PS1='$ ';
        else
            PS1='%F{red}$%f ';
        fi
    }

    # A simple PS1 with minimal git support
    _ps1_simple_git_prompt() {
        if [[ $? == 0 ]]; then
            local dollar='$'
        else
            local dollar='%F{red}$%f';
        fi

        local git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

        if [[ ! -z "${git_branch}" ]]; then
            PS1="${dollar} (%F{yellow}${git_branch}%f) "
        else
            PS1="${dollar} "
        fi
    }


# fzf
    if [[ ! "$PATH" == */home/me/.local/share/fzf/bin* ]]; then
      export PATH="$PATH:/home/me/.local/share/fzf/bin"
    fi

    [[ $- == *i* ]] && source "/home/me/.local/share/fzf/shell/completion.zsh" 2> /dev/null

    source "/home/me/.local/share/fzf/shell/key-bindings.zsh"


# zplug
    source ~/.zplug/init.zsh

    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "zsh-users/zsh-history-substring-search"
    zplug "chrissicool/zsh-256color"
    zplug "plugins/colored-man-pages", from:oh-my-zsh
    zplug "tiehuis/zig-compiler-completions", use:"completions/_zig", defer:2

    zplug load


# completions
    autoload -U compinit
    compinit
