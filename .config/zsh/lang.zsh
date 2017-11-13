# Language specific exports/configuration

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
