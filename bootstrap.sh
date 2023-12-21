#!/usr/bin/env bash

# NEOVIM
source $HOME/.nix-profile/etc/profile.d/nix.sh
nix-env -iA nixpkgs.neovim > /tmp/lixo 2>&1

cd $HOME/.dotfiles
stow nvim -t $HOME
stow nvchad-custom -t $HOME/.config/nvim/lua

#cp -a nvim/. ~
#cp -a nvchad-custom/. ~/.config/nvim/lua