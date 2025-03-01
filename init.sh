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
    sudo apt-get install ripgrep -y
fi

sudo apt-get install lua-language-server rust-analyzer luarocks golang cargo ruby gem perl fd-find -y
sudo luarocks install jsregexp
npm install -g vscode-html-languageserver-bin vscode-css-languageserver-bin typescript typescript-language-server eslint htmlhint neovim
nvim
nvim --headless -c "MasonInstall lua-language-server python-lsp-server rust-analyzer typescript-language-server stimulus-language-server clangd intelephense bash-language-server" -c "qall"
