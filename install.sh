#!/usr/bin/env bash

cd "$(dirname "$0")"

# install bashrc
cp dotfiles/.bashrc ~
rm -rf ~/.bash
cp -r dotfiles/.bash ~

# vimrc
cp dotfiles/.vimrc ~
cp dotfiles/.ycm_extra_conf.py ~
vim +PlugInstall +qall
