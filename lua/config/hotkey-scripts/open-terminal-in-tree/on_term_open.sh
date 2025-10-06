#!/bin/zsh

source ~/.config/nvim/lua/config/hotkey-scripts/open-terminal-in-tree/.file_paths.conf

cd "$DIR_PATH"

nvim $FILE_PATH

exec zsh
