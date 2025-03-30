return {

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
