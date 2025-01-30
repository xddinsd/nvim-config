-- Highlight identation and scope using colored lines

return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require('ibl').setup {

            indent = {
                char = '┊', 
                -- Highlight is linked to color scheme
                highlight = {
                    'keyword',
                    'Function', }, },

            scope = {
                enabled     = true,
                show_start  = false,
                show_end    = false,  
                char        = '│', 
                highlight   = { '@Keyword' } }, } end }
