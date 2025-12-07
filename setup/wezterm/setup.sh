#!/bin/bash

set -e

# set PATH
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

# set .config/wezterm configuration
mkdir -p $HOME/.config
if [ ! -e "$HOME/.config/wezterm" ]; then
    ln -s "$DOTFILES_DIR/.config/wezterm" "$HOME/.config"
fi
