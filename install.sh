#!/usr/bin/env bash

cd "$(dirname "$0")"
cp dotfiles/.bashrc ~
rm -rf ~/.bash
cp -r dotfiles/.bash ~
