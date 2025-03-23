-- Adds language go to definition, linter, launguage docs in-place
-- Autocomplete and debugger
return {
    -- LSP servers
    {
        'neovim/nvim-lspconfig',
        build = ":TSUpdate",
        config = function()
            local nvim_lsp      = require('lspconfig')
            local capabilities  = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            local window_transparency   = 20

            -- Window settings, same as in nvim-cmp
                  vim.lsp.handlers["textDocument/hover"]          = vim.lsp.with(
                                                                          vim.lsp.handlers.hover, {
                                                                              border = "single",
                                                                              winblend = window_transparency })

                  vim.lsp.handlers["textDocument/signatureHelp"]  = vim.lsp.with(
                                                                          vim.lsp.handlers.signature_help, {
                                                                              border = "single",
                                                                              winblend = window_transparency })

            -- LSPs
                -- Shell
                    nvim_lsp.fish_lsp       .setup{capabilities = capabilities}
                -- Config langs
                    nvim_lsp.luau_lsp       .setup{capabilities = capabilities} -- Lua
                    nvim_lsp.hyprls         .setup{capabilities = capabilities}
                    nvim_lsp.vimls          .setup{capabilities = capabilities}
                    nvim_lsp.cmake          .setup{capabilities = capabilities}
                    nvim_lsp.nil_ls         .setup{capabilities = capabilities} -- Nix lang
                    nvim_lsp.somesass_ls    .setup{capabilities = capabilities} -- CSS SCSS SASS
                    nvim_lsp.terraform_lsp  .setup{capabilities = capabilities}
                -- Info langs
                    nvim_lsp.html           .setup{capabilities = capabilities}
                    nvim_lsp.ltex_plus      .setup{capabilities = capabilities} -- latex and markdown
                -- Main
                    -- nvim_lsp.metals         .setup{capabilities = capabilities} -- Scala fast LSP with no debug support (requires self-installed metals) (to toggle uncomment and delete nvim-metals below)

                    -- nvim_lsp.sqlls          .setup{capabilities = capabilities} -- Turn off to deal with YQL
                    nvim_lsp.ruff           .setup{capabilities = capabilities}
                    -- nvim_lsp.pylyzer        .setup{capabilities = capabilities} -- Python
                                                                                            end, },

    -- Dedicated scala LSP to provide debugger
    {
        'scalameta/nvim-metals',
        ft           = { "scala", "sbt" },
        dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },

        -- Metals settings
        opts = function()
             local metals_config = require("metals").bare_config()

             metals_config.settings = {
                   showImplicitArguments = true, }

            metals_config.init_options.statusBarProvider = "off" -- Turn on if no fidget.nvim

            metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

            metals_config.on_attach = function(client, bufnr)
                require("metals").setup_dap() end return metals_config end,

        -- Add autocmd to launch metals based on filetype
        config = function(self, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern     = self.ft,
                callback    = function()
                    require("metals").initialize_or_attach(metals_config) end,
                group       = nvim_metals_group,})

            -- Debug using nvim-dap
            local dap = require("dap")
            dap.configurations.scala = {
                {
                    type    = "scala",
                    request = "launch",
                    name    = "Run",
                    metals  = {
                        runType = "run",},},
                {
                    type    = "scala",
                    request = "launch",
                    name    = "Test file",
                    metals  = {
                        runType = "testFile",},},
                {
                    type    = "scala",
                    request = "launch",
                    name    = "Test build",
                    metals  = {
                        runType = "testTarget",},},}                                                    end, },

    -- LSP status notifications
    {
        "j-hui/fidget.nvim",
        opts = { }, },

    -- Autocomplete
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',         -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',           -- Buffer source
            'hrsh7th/cmp-path',             -- Path source
            'hrsh7th/cmp-cmdline',          -- Command line source
            'saadparwaiz1/cmp_luasnip',     -- Snippet source
            'L3MON4D3/LuaSnip',             -- Snippet engine
            'rafamadriz/friendly-snippets'  -- Collection of snippets
                                                                        },
        config = function()
            local cmp                   = require('cmp')
            local autocomplete_enabled  = false -- On startup autocomplete is disabled
            local window_transparency   = 20
            local hint_max_len          = 20

            local function toggle_autocomplete()
                autocomplete_enabled    = not autocomplete_enabled
                local new_autocomplete  = autocomplete_enabled and { require('cmp.types').cmp.TriggerEvent.TextChanged } or {}
                cmp.setup({
                    completion = { autocomplete = new_autocomplete } })                                                         end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) end, },

                -- Adds transparency and borders to autocomplete window
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight    = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel",
                        winblend        = window_transparency   }),
                    documentation = cmp.config.window.bordered({
                        winhighlight    = "Normal:CmpPmenu,FloatBorder:FloatBorder",
                        winblend        = window_transparency   }), },

                -- Limit autocomplete hint width
                formatting = {
                    format = function(entry, vim_item)
                        if #vim_item.abbr > hint_max_len then
                            vim_item.abbr = string.sub(vim_item.abbr, 1, hint_max_len - 1) .. '…' end return vim_item end },

                -- Key mappings
                mapping = {
                    ['<C-c>'] = function(fallback)
                                    toggle_autocomplete()
                                    if cmp.visible() then
                                        cmp.close()
                                    else
                                        cmp.complete()      end end,
                    ['<Tab>']       = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<S-Tab>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<CR>']        = cmp.mapping.confirm({ select = true }), },

                -- LSP sources and max items shown as autocomplete hints
                sources = cmp.config.sources({
                    { name = 'nvim_lsp',    max_item_count = 3 },
                    { name = 'luasnip',     max_item_count = 3 }, },
                {
                    { name = 'buffer',      max_item_count = 3 },
                    { name = 'path',        max_item_count = 3 }, }),

                completion = {
                    autocomplete = autocomplete_enabled }, })                                                                           end, },

    -- Debugger
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')

            vim.fn.sign_define('DapBreakpoint', {
                                                    text    = '●',
                                                    texthl  = 'Error',
                                                    linehl  = '',
                                                    numhl   = '' })
            vim.fn.sign_define('DapStopped', {
                                                    text    = '●',
                                                    texthl  = 'WarningMsg',
                                                    linehl  = '',
                                                    numhl   = '' })             end },
    -- Minimal dapui
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "folke/lazydev.nvim" },

        config = function()
            local dap, dapui = require("dap"), require("dapui")

            require("lazydev").setup({
                library = { "nvim-dap-ui" }, })
            -- Listeners to open/close
            dap.listeners.before.launch.dapui_config            = function()
                dapui.open()  end

            dap.listeners.before.event_terminated.dapui_config  = function()
                dapui.close() end

            dap.listeners.before.event_exited.dapui_config      = function()
                dapui.close() end

            dapui.setup({
                    layouts = {
                      {
                        elements = {
                            "breakpoints",
                            "stacks",
                            "scopes", },
                        size        = 40,
                        position    = "left", }, }, })                          end, },

    -- Special extension to add python debug support
    {
        'mfussenegger/nvim-dap-python',
        config = function()
            local dap_python  = require('dap-python')
            local python_path = '/usr/bin/python'
            dap_python.setup(python_path)               end }, }

