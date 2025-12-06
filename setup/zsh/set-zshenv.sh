#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"



if [ ! -e "$HOME/.zshenv" ]; then
    ln -s "$SCRIPT_DIR/.zshenv" "$HOME/.zshenv"
fi

mkdir -p $HOME/.config
if [ ! -e "$HOME/.conifg/zsh" ]; then
    ln -s "$DOTFILES_DIR/.config/zsh" "$HOME/.config/zsh"
fi