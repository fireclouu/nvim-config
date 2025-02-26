# Minimal NVIM config
My goal is to make it minimal as possible that it will work on most of my devices without needing for too much dependencies and will guaranteed to work with newer versions of neovim releases.
Tested on neovim version `>=v0.10.3`.

## Installation
### Linux
Using this shell command to automate installation:
```
if [ -d "$HOME/.config/nvim" ]; then
    cp -r "$HOME/.config/nvim $HOME/.config/nvim.old"
fi
mkdir -p "$HOME/.config/nvim"
cd "$HOME/.config/nvim"
git clone https://github.com/fireclouu/nvim-config .
./init.sh
```
