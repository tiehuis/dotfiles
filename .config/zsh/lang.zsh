# Language specific exports/configuration

# Python
export PATH=$PATH:~/.local/bin

# Rust
export PATH=$PATH:~/.local/share/cargo/bin
export CARGO_HOME=~/.local/share/cargo
export RUSTUP_HOME=~/.local/share/rustup
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Ruby
export PATH=$PATH:~/.gem/ruby/2.4.0/bin

# Js
export PATH=$PATH:~/.local/share/npm/bin

# zig
compinit -Uz _zig
# see https://github.com/zig-lang/docker-zig
alias zigi='docker run --rm -it -u "$UID:$(id -g)" -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -v "$(pwd)":/z zig bash'
export PATH=$PATH:~/local/bin
