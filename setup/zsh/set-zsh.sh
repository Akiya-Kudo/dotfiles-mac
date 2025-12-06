#!/bin/bash

set -e

# set PATH
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

# set .zshenv
if [ ! -e "$HOME/.zshenv" ]; then
    ln -s "$SCRIPT_DIR/.zshenv" "$HOME/.zshenv"
fi

# create .secret.zsh
if [ ! -e "$DOTFILES_DIR/.config/zsh/.secret.zsh" ]; then
    touch "$DOTFILES_DIR/.config/zsh/.secret.zsh"
fi

# set .config/zsh configuration
mkdir -p $HOME/.config
if [ ! -e "$HOME/.config/zsh" ]; then
    ln -s "$DOTFILES_DIR/.config/zsh" "$HOME/.config"
fi

# set command in ~/.local/bin/dotfiles
if [ ! -e "$HOME/.local/bin" ]; then
    mkdir -p $HOME/.local/bin
    ln -s "$DOTFILES_DIR/command" "$HOME/.local/bin"
fi