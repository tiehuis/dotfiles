# A simple PS1 alternative
# PS1="$ "

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
