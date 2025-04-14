return {
    -- Default opts for russian/english keyboard
    'Wansmer/langmapper.nvim',
    lazy = false,
    priority = 1,
    config = function()
        require('langmapper').setup({hack_remap = true})    end,    }

