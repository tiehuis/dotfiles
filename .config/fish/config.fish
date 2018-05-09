if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

# prompt
    function fish_prompt
        if [ "$status" != 0 ]
            set_color red
        end

        echo -n "\$ "
        set_color normal

        set git_branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)
        if [ -n "$git_branch" ]
            echo -n "("
            set_color yellow
            echo -n "$git_branch"
            set_color normal
            echo -n ") "
        end
    end

# general
    set fish_greeting

# exports
    set -U EDITOR nvim
    set -U VISUAL "$EDITOR"
    set -U WINEDLLOVERRIDES 'winemenubuilder.exe=d'

    set -U XDG_CACHE_HOME "$HOME/.cache"
    set -U XDG_CONFIG_HOME "$HOME/.config"
    set -U XDG_DATA_HOME "$HOME/.local/share"

    set -gx WEECHAT_HOME "$XDG_CONFIG_HOME/weechat"

# aliases
    alias g 'git'
    alias vim 'nvim'
    alias mpi 'mpv -profile image'
    alias mpa 'mpv -profile music'
    alias dotfiles 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

    alias mpashuf 'mpv -profile music (find ~/sndo -mindepth 2 -maxdepth 2 -type d | shuf -n 1)'

# lang-specific
    # python
    set PATH "$HOME/.local/bin" $PATH

    # rust
    set PATH "$HOME/.local/share/cargo/bin" $PATH
    set -x CARGO_HOME "$HOME/.local/share/cargo"
    set -x RUSTUP_HOME "$HOME/.local/share/rustup"
    set -x RUST_SRC_PATH "(rustc --print sysroot)/lib/rustlib/src/rust/src"

    # go
    set PATH "$HOME/.go/bin" $PATH
    set -x GOPATH "$HOME/.go"

    # js
    set PATH "$HOME/.local/share/npm/bin" $PATH

    # zig
    set PATH "$HOME/local/bin" $PATH

    # fzf
    set PATH "$HOME/.local/share/fzf/bin" $PATH
