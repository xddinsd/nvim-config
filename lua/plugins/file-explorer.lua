
return {
    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'echasnovski/mini.icons', 'nvim-tree/nvim-web-devicons' },
        config = function()
            require'nvim-tree'.setup {
                actions = {
                    open_file = {
                        -- Close file explorer after on selected file opened
                        quit_on_open = true } } } end, },

    -- File search
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        n = {
                            ["q"]       = require('telescope.actions').close,
                            ["<Esc>"]   = require('telescope.actions').close,  } }, }, } end, },

    -- File history
    {
        -- This extension is making a local git repository
            -- of files those are edited with nvim and tracks its changes
        'dawsers/telescope-file-history.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('file_history').setup {
                backup_dir  = "~/.nvim-file-history-git",
                git_cmd     = "git" }
            require('telescope').load_extension('file_history') end, }, }

