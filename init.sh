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
    apt-get install ripgrep -y
fi

npm install -g bash-language-server vscode-html-languageserver-bin vscode-css-languageserver-bin intelephense typescript-language-server

apt-get install lua-language-server -y
# brew install lua-language-server
