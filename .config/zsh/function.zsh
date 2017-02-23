fzf-open-file-or-dir() {
    local cmd="command find -L . \
        \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
        -o -type f -print \
        -o -type d -print \
        -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
    local out=$(eval $cmd | fzf-tmux --exit-0)

    if [ -f "$out" ]; then
        $EDITOR "$out" < /dev/tty
    elif [ -d "$out" ]; then
        cd "$out"
        zle reset-prompt
    fi
}
