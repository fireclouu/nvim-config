#!/bin/bash
# Make sure python3 and conda is installed

echo "Preparing virtual env..."
if [ ! -d "$HOME"/venv ]; then
    mkdir -p $HOME/venv
    python3 -m venv $HOME/venv/myenv
    source $HOME/venv/myenv/activate
else

MY_SOURCE='source $HOME/venv/myenv/bin/activate'
if ! grep -Fxq "$MY_SOURCE" "$HOME/.zshrc"; then
    echo "Appending venv source to .zshrc"
    echo "$MY_SOURCE" >> $HOME/.zshrc
fi

if ! grep -Fxq "$MY_SOURCE" "$HOME/.bashrc"; then
    echo "Appending venv source to .bashrc"
    echo "$MY_SOURCE" >> $HOME/.bashrc
fi

python3 -m pip3 install pyright
npm install -g bash-language-server vscode-html-languageserver-bin vscode-css-languageserver-bin intelephense typescript-language-server pyright
sudo apt-get install ripgrep
