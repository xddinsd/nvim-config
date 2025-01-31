## Xddinsd's neovim config

Multi-window config for data engineering.


> At some point I found myself using vim for work for a two months instead of VSCODE.
> A lot of different workflows managed same time with small scripts - that's a perfect job for slightly modified neovim

### Features
* Easy and resource-effective plugins management                              ([Lazy.nvim](https://github.com/folke/lazy.nvim))
* File explorer with hotkeys to open folder/file in dedicated terminal/nvim   ([nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) with custom lua&zsh module)
* File search and history                                                     ([telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)/[file-history](https://github.com/dawsers/telescope-file-history.nvim))
* Syntax highlighting                                                         ([nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter))
* Autocomplete                                                                ([nvim-cmp](https://github.com/hrsh7th/nvim-cmp))
* Simple debugger                                                             ([nvim-dap](https://github.com/mfussenegger/nvim-dap)/[ui](https://github.com/rcarriga/nvim-dap-ui))
* Dark color scheme                                                           ([tokyonight.nvim](https://github.com/folke/tokyonight.nvim))
* Colored identations                                                         ([indent-blackline](https://github.com/lukas-reineke/indent-blankline.nvim))


#### Requirements
* git
* [Neovim](https://github.com/neovim/neovim) 0.10+

### Installation
```bash
mkdir -p ~/.config/nvim
```
```bash
cd ~/.config/nvim
```
```bash
git clone https://github.com/xddinsd/nvim-config.git ./
```
