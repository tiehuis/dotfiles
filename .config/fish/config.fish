if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

# prompt
    function fish_prompt
        set -g __fish_git_prompt_showupstream verbose
        set -g __fish_git_prompt_use_informative_chars
        set -g __fish_git_prompt_showcolorhints
        printf '%s $ ' (fish_git_prompt)
    end

# general
    set fish_greeting
    set PATH "$HOME/bin" $PATH

# exports
    set -U EDITOR nvim
    set -U VISUAL "$EDITOR"
    set -U WINEDLLOVERRIDES 'winemenubuilder.exe=d'
    set -U BROWSER firefox

    set -U XDG_CACHE_HOME "$HOME/.cache"
    set -U XDG_CONFIG_HOME "$HOME/.config"
    set -U XDG_DATA_HOME "$HOME/.local/share"

# aliases
    alias g 'git'
    alias vim 'nvim'
    alias mpi 'mpv -profile=image'
    alias mpa 'mpv -profile=music'
    alias unp 'unp -U'

# fzf
    set PATH "$HOME/.local/share/fzf/bin" $PATH
    set -x FZF_CTRL_T_COMMAND '
        if git rev-parse --is-inside-work-tree > /dev/null 2>&1
            git ls-files --cached --others --exclude-standard
        else
            fd --type f
        end
    '

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

    # zig
    set PATH "$HOME/local/zig/bin" $PATH
