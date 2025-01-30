function dap_close_all_windows()
    local dap, dapui = require("dap"), require("dapui")
    dap.terminate()
    dap.disconnect({ terminateDebuggee = true })
    dap.close()
    dapui.close()
    for _, win in pairs(vim.api.nvim_list_wins()) do
            local buf               = vim.api.nvim_win_get_buf(win)
            local buf_name          = vim.api.nvim_buf_get_name(buf)
            local buf_is_readonly   = vim.api.nvim_buf_get_option(buf, 'readonly')
            if  1 ~= 1                                     
                    or buf_is_readonly  -- All source code buffers are RO
                    or buf_name:match('%[dap%-terminal%d*%]')
                    or buf_name:match('%[dap%-repl%-%d+%]'  ) then
                vim.api.nvim_buf_delete(buf, { force = true }) end end end
