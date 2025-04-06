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

    -- Custom tmp files dirs
        vim.opt.directory					= vim.fn.stdpath('config') .. '/.swp'
        vim.opt.undodir					    = vim.fn.stdpath('config') .. '/.undo'
        vim.opt.backupdir					= vim.fn.stdpath('config') .. '/.backup'

-- Other
    -- Highlight matching brackets
        vim.opt.showmatch 					= true
    -- Remove EOL trailing whitespaces on file save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function()
                vim.cmd("%s/\\s\\+$//e")                end, })

    -- Autocmd for firenvim font fix (https://github.com/glacambre/firenvim/issues/972)
        vim.api.nvim_create_autocmd("UIEnter", {
              pattern = "*",
              callback = function()
                  vim.cmd("if exists('g:started_by_firenvim')\nset guifont=Monaco:h18\nendif")    end  })


