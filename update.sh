#!/usr/bin/env bash

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "update.sh" \
  --exclude "README.md" --exclude "hybrid.vim" -avh --no-perms . ~;

cp hybrid.vim ~/.vim/bundle/vim-airline/autoload/airline/themes;
