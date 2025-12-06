#!/bin/zsh

set -e

# set PATH
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

mkdir -p $HOME/.config/starship
if [ ! -e "$HOME/.config/starship" ]; then
    ln -s "$DOTFILES_DIR/.config/starship/starship.toml" "$HOME/.config/starship/starship.toml"
fi