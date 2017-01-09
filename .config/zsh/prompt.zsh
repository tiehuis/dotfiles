# A simple PS1 alternative
# PS1="$ "

precmd() { simple_error_prompt; }

# A simple PS1 which also highlights the bad error codes
simple_error_prompt() {
    if [[ $? == 0 ]]; then
        PS1='$ ';
    else
        PS1='%F{red}$%f ';
    fi
}
