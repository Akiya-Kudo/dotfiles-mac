#!/bin/bash

set -e

# set PATH
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

# set ~/.emacs.d/init.el
mkdir -p $HOME/.emacs.d
if [ -e "$HOME/.emacs.d/init.el" ]; then
    ln -s "$SCRIPT_DIR/init.el" "$HOME/.emacs.d/init.el"
fi

# set emacs configuration (init.el)
mkdir -p $HOME/.config
if [ ! -e "$HOME/.config/emacs" ]; then
    ln -s "$DOTFILES_DIR/.config/emacs" "$HOME/.config"
fi