# Language specific exports/configuration

# Python
export PATH=$PATH:~/.local/bin

# Rust
export PATH=$PATH:~/.local/share/cargo/bin
export CARGO_HOME=~/.local/share/cargo

# Ruby
export PATH=$PATH:~/.gem/ruby/2.4.0/bin

# Opam
export OPAMROOT=~/.local/share/opam
source ~/.local/share/opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
