#!/usr/bin/env bash

# Packages
source $HOME/.nix-profile/etc/profile.d/nix.sh
nix-env -iA nixpkgs.neovim nixpkgs.fd nixpkgs.tmux > /tmp/lixo 2>&1

cd $HOME/.dotfiles
git submodule update --init --recursive

stow nvim
stow nvchad-custom -t $HOME/.config/nvim/lua
stow tmux
# Override custom gitpod .gitconfig
rm $HOME/.gitconfig
stow git
