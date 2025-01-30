#!/bin/zsh

# Reading paths which are saved with lua config
source ~/.config/nvim/lua/config/scripts/open-nvim-tree-file-in-new-terminal/.file_paths.conf

# Moving to directory after script closes
cd "$DIR_PATH" || exit

# Open file with neovim
nvim "$FILE_PATH"

# Leave terminal opened
exec zsh
