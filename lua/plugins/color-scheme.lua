return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = { },
        config = function()
            vim.g.tokyonight_italic_functions = true
            vim.cmd.colorscheme('tokyonight-night') end }, }
