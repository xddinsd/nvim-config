# Xddinsd's neovim config

Multi-window config for data engineering.


## Features
* Easy and resource-effective plugins management                              ([Lazy.nvim](https://github.com/folke/lazy.nvim))
* File explorer with hotkeys to open folder/file in dedicated terminal/nvim   ([nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) with custom lua&zsh module)
* File search and history                                                     ([telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)/[file-history](https://github.com/dawsers/telescope-file-history.nvim))
* Syntax highlighting                                                         ([nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter))
* Autocomplete & snippets                                                     ([nvim-cmp](https://github.com/hrsh7th/nvim-cmp) & [LuaSnip](https://github.com/L3MON4D3/LuaSnip))
* Simple debugger                                                             ([nvim-dap](https://github.com/mfussenegger/nvim-dap)/[ui](https://github.com/rcarriga/nvim-dap-ui))
* Dark color scheme                                                           ([tokyonight.nvim](https://github.com/folke/tokyonight.nvim))
* Colored identations                                                         ([indent-blackline](https://github.com/lukas-reineke/indent-blankline.nvim))

### Config structure

- `./lua/config` - All non-plugin settings
  - `/lazy.lua`:      load package manager (loads vim options)
  - `/vim-opts.lua`:  vim options
  - `/hotkeys.lua`:   mappings for all hotkeys (loads scripts) 
  - `/scripts/*/*`:   custom scripts

- `./lua/plugins` - Plugins and their settings
  - `/autocomplete.lua`: plugins for autocomplete and snippet support (loads custom snippets)
  - `/*.lua`:            plugins

- `./lua/custom-snippets` - Custom snippets
  - `/loader.lua`:       loader for custom snippets
  - `/*/*.lua`:          custom snippets
                

### Requirements
* C compiler in path, libstdc++
* git >= 2.19
* Python >= 3.9
* [Neovim](https://github.com/neovim/neovim) 0.9.0+
* [tree-sitter](https://github.com/tree-sitter/tree-sitter)
* [pip: nynvim](https://github.com/neovim/pynvim)
* [luarocks](https://github.com/luarocks/luarocks?tab=readme-ov-file)

  #### Optional requirements
  * Java-17-openJDK in path (only for Scala LSP 'Metals'. More info in [issue](https://github.com/scalameta/metals/issues/6952))
  
    ##### LSP servers
    > Required for linting, autocompletion, debugging and other launguage-specific features.
    > Most of them are written in pure lua so they don't require system-wide installation. Others are listed below 
    * Fish:                       [fish-lsp](https://github.com/ndonfris/fish-lsp)
    * Vim laungiage:              [vim-language-server](https://github.com/prabirshrestha/vim-lsp)
    * Cmake:                      |pip| [cmake-language-server](https://github.com/regen100/cmake-language-server)
    * SCSS, SASS:                 [some-sass-language-server](https://github.com/wkillerud/some-sass)
    * Terraform:                  [terraform-lsp](https://github.com/juliosueiras/terraform-lsp)
    * HTML, CSS, JSON:            [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted)
    * LATEX, markdown:            [ltex-ls-plus-bin](https://github.com/ltex-plus/ltex-ls-plus)
    * Python:                     |pip| [pylyzer](https://github.com/mtshiba/pylyzer) & [ruff](https://github.com/astral-sh/ruff)
    * Java:                       [java-language-server](https://github.com/georgewfraser/java-language-server)
    * Metals:                     [metals](https://github.com/scalameta/metals)
    * SQL:                        [sqls](https://github.com/sqls-server/sqls)
    
    ##### Debug
    * Python: |pip| [debugpy](https://github.com/microsoft/debugpy)
    * Scala:  [metals](https://github.com/scalameta/metals)

  
### Installation
- Create dir for config 
  ```bash
  mkdir -p ~/.config/nvim
  ```
  ```bash
  cd ~/.config/nvim
  ```
- Clone the repo
  ```bash
  git clone https://github.com/xddinsd/nvim-config.git ./
  ```
- Open nvim and wait till all plugins are installed with lazy.nvim
- Click `Ctrl+h` in normal mode to toggle hotkeys hint
- Enjoy!

### Notes 
- For terminals except alacritty or if you want to change the folder where neovim config is stored, configure manually:  \
    `./lua/config/scripts/open-nvim-tree-file-in-new-terminal/*`                                                         \
    This script opens a new terminal (hotkeys `Space-Enter` and `Space-t-Enter`)                                         \
    it's implementation required use of absolete paths to store values in .conf and excplicit command to open a terminal

### Troubleshooting
- Having problems with nvim-tree in 0.11dev neovim?                              \
  Comment 27+ line in `~/local/share/nvim/lazy/nvim-tree.lua/lua/nvim-tree.lua`. \
  Plugin won't update (!!!) but it solves the issue                              
