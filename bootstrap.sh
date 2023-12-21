#!/usr/bin/env bash

# NEOVIM
source $HOME/.nix-profile/etc/profile.d/nix.sh
nix-env -iA nixpkgs.neovim > /tmp/lixo 2>&1

cd $HOME/.dotfiles
git submodule update --init --recursive
stow nvim -t $HOME
stow nvchad-custom -t $HOME/.config/nvim/lua