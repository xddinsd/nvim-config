
-- Clone and install lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    -- If no folder
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        -- Clone
        local lazyrepo  = "https://github.com/folke/lazy.nvim.git"
        local out       = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        -- If error cloned
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out, "WarningMsg" },
                { "\nPress any key to exit..." }, }, true, {})
            vim.fn.getchar()
            os.exit(1) end end

    -- Add lazy.nvim folder to runtime
    vim.opt.rtp:prepend(lazypath)


-- Note from lazy.nvim devs
    -- Make sure to setup `mapleader` and `maplocalleader` before
    -- loading lazy.nvim so that mappings are correct.
    -- This is also a good place to setup other settings (vim.opt)


-- Vim opts

    -- Hotkeys

        -- Map <leader> and <localleader> 
            vim.g.mapleader         = " "
            vim.g.maplocalleader    = "\\"

        -- Mouse

            -- Allow mouse in all modes
                vim.opt.mouse					    = 'a'

            -- Fast scroll
                vim.opt.ttyfast					    = true


    -- Line

        -- Highlingt line where cursor is on
            vim.opt.cursorline      = true

        -- Line numeration
        
            -- Show line numeration
                vim.opt.number 		    = true
            -- Line numeration is relative of a current line
                vim.opt.relativenumber  = true


    -- Search

        -- Ignore case
            vim.opt.ignorecase 	= true 

        -- Highlight search results
            vim.opt.hlsearch    = true


    -- Identation

        -- Tabs are 4 spaces

            -- Tab is displayed as 4 spaces
                vim.opt.tabstop 	= 4

            -- Writing tabs     as 4 spaces 
                vim.opt.shiftwidth  = 4

        -- Convert tabs to spaces
            vim.opt.expandtab 	    = true

        -- Add identation for new line
            vim.opt.autoindent 		= true


    -- Vim system settings
        
        -- Disable netrw loading for nvim-tree
            vim.g.loaded_netrw         = 1
            vim.g.loaded_netrwPlugin   = 1

        -- Use OS clipboard buffer
            vim.opt.clipboard					= 'unnamedplus'

        -- Disable swapfile
            vim.opt.swapfile 					= false

        -- Backup dir (possibly overrided by telescope-file-history)
            vim.opt.backupdir					= '~/.cache/nvim'

    -- Other
        -- Highlight matching brackets
            vim.opt.showmatch 					= true


-- Setup lazy.nvim
    require("lazy").setup({
        spec = {
            -- Import plugins
            { import = "plugins" }, },

        -- Colorscheme that will be used when installing plugins.
        install = { colorscheme = { "tokyonight" } },

        -- Automatically check for plugin updates
        checker = { enabled = true, notify = false }, })

-- Load hotkeys
require("config.hotkeys")

-- Load yql syntax highliting
require("config.scripts.yql-syntax-highliting.config").setup()


