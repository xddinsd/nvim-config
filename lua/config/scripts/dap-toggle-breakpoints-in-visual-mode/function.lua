function dap_toggle_breakpoints_in_visual_mode()
    local dap           = require('dap')

    local start_pos     = vim.fn.getpos("'<")
    local end_pos       = vim.fn.getpos("'>")

    local start_line    = start_pos[2]
    local end_line      = end_pos[2]
    
    for line = start_line, end_line do
        vim.fn.setpos('.', {0, line, 0, 0})  
        dap.toggle_breakpoint() end end
