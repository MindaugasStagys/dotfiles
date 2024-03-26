export PATH=$HOME/bin:$HOME/openssl/bin:/opt/nvim-linux64/bin:$PATH
export PKG_CONFIG_PATH=$HOME/openssl/lib/pkgconfig:$PKG_CONFIG_PATH
export SHELL=$(which zsh)
export TERM=xterm-256color
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
