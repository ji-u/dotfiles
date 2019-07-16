#!/usr/bin/env bash

cd "$(dirname "$0")"
cp dotfiles/.bashrc ~
if [ -e "~/.bash" ]; then
    rm -rf ~/.bash
fi
cp -r dotfiles/.bash ~
