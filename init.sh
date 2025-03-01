#!/bin/bash
# Make sure python3 is installed

echo "Updating pm caches"
apt update -y && apt upgrade -y
echo "Preparing virtual env..."
if [ ! -d "$HOME/venv" ]; then
    mkdir -p "$HOME/venv"
    python3 -m venv "$HOME/venv/myenv"
else
    MY_SOURCE='source $HOME/venv/myenv/bin/activate'
    if ! grep -Fxq "$MY_SOURCE" "$HOME/.zshrc"; then
        echo "Appending venv source to .zshrc"
        echo "$MY_SOURCE" >> "$HOME/.zshrc"
    fi

    if ! grep -Fxq "$MY_SOURCE" "$HOME/.bashrc"; then
        echo "Appending venv source to .bashrc"
        echo "$MY_SOURCE" >> "$HOME/.bashrc"
    fi
fi

source "$HOME/venv/myenv/bin/activate"

python3 -m pip install pyright ripgrep
if [ $? -ne 0 ]; then
    echo "Since pip fail, we check if ripgrep is available on default pm"
    sudo apt-get install \
        ripgrep \
        -y
fi

sudo apt-get install \
    cargo \
    fd-find \
    gem \
    golang \
    lua-language-server \
    luarocks \
    perl \
    ruby \
    rust-analyzer \
    -y

sudo luarocks install \
    jsregexp

npm install -g \
    eslint \
    htmlhint \
    neovim
    typescript-language-server \
    vscode-css-languageserver-bin typescript \
    vscode-html-languageserver-bin

# First Init
nvim --headless -c "Lazy install" +qa
nvim --headless -c "Lazy sync" +qa
nvim --headless -c "Lazy clean" +qa

nvim --headless -c "MasonInstall \
    bash-language-server \
    clangd \
    intelephense \
    jdtls \
    lua-language-server \
    python-lsp-server \
    rust-analyzer \
    stimulus-language-server \ # html, erb, php, blade
    typescript-language-server" +qa
