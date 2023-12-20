#!/usr/bin/env bash

# NEOVIM
cd $(mktemp -d)

curl -LO "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract >/dev/null
mkdir -p /home/gitpod/.local/bin
ln -s $(pwd)/squashfs-root/AppRun /home/gitpod/.local/bin/nvim
#sudo ln -s $(pwd)/squashfs-root/AppRun /usr/bin/nvim

cd -
cp -a nvim/. ~
cp -a nvchad-custom/. ~/.config/nvim/lua