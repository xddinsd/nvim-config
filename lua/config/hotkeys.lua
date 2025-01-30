-- Hotkeys
    local keymap              = vim.keymap.set
    local hotkey_default_opts = { noremap = true, silent = true }

    -- Vim hotkeys
        -- Removing without copy            for p, d, x
        -- Removing with    copy as usual   for P, D, X
            -- p
                keymap('v',            'p',        '"_dP',     hotkey_default_opts)
                keymap('v',            'P',        '"p',       hotkey_default_opts)
            -- d
                keymap({'n', 'v'},     'D',        'd',        hotkey_default_opts)
                keymap({'n', 'v'},     'd',        '"_d',      hotkey_default_opts) 
            -- x
                keymap({'n', 'v'},     'X',        'x',        hotkey_default_opts)
                keymap({'n', 'v'},     'x',        '"_x',      hotkey_default_opts) 


    -- Nvim shprtcuts
        -- Ctrl + /             = Stop searching
            keymap('n',     '<C-/>',    ':noh<CR>',     hotkey_default_opts)


    -- Plugin hotkeys
    
        -- File-explorer(nvim-tree)
        
            -- Space + f        = Toggle file explorer
                keymap('n',             '<leader>fe',       ':NvimTreeToggle<CR>',                                                              hotkey_default_opts)

            -- Space + G        = Find current file in file explorer (go file)
                keymap('n',             '<leader>gf',       ':NvimTreeFindFile<CR>',                                                            hotkey_default_opts)

            -- Space + Enter = Open selected file in Nvim in new terminal window
                require("config.scripts.open-nvim-tree-file-in-new-terminal.functions")
                keymap('n',             '<leader><CR>',     ':lua save_dir_under_nvim_tree_cursor(); open_file_in_nvim_in_new_terminal()<CR>',  hotkey_default_opts)

            -- Space + t + Enter = Open selected folder in new terminal window
                require("config.scripts.open-nvim-tree-file-in-new-terminal.functions")
                keymap('n',             '<leader>t<CR>',    ':lua save_dir_under_nvim_tree_cursor(); open_folder_in_new_terminal()<CR>',        hotkey_default_opts)

            -- Enter             = Open file
            --
            -- Space + cd        = Change directory
                keymap('n',             '<leader>cd',       ':lua require("nvim-tree.api").tree.change_root_to_node()<CR>',                     hotkey_default_opts)

    
            -- File search (telescope.nvim)
            
                -- Space + ff       = Find by filename in dir under the cursor in nvim-tree (file find)
                    require("config.scripts.telescope-find-files-in-nvim-tree.functions")
                    keymap('n',         '<leader>ff',       ':lua telescope_find_files_in_nvim_tree()<CR>',                                     hotkey_default_opts)

                -- Space + fg       = Find by contents (file grep)
                    require("config.scripts.telescope-find-files-in-nvim-tree.functions")
                    keymap('n',         '<leader>fg',       ':lua telescope_grep_files_in_nvim_tree()<CR>',                                     hotkey_default_opts)

                -- q or Esc in      = Close telescope (telescope has normal and insert modes. these hotkeys are in normal mode)
                --
                
            -- File history (telescope-file-history.nvim)
                -- Space + s + h    = Show file history 
                    keymap('n',         '<leader>sh',       ':Telescope file_history history<CR>',                                              hotkey_default_opts)

                -- Enter            = Open selected file backup in new buffer (read only)
                --
                -- Space + q        = Get back from a new buffer (buffer quit)
                    keymap('n',         '<leader>bq',        ':bd!<CR>',                                                                        hotkey_default_opts)

                -- Space + s + b    = Create a backup with tag (save backup) 
                    -- !!! Backup does :w. If file is already saved no tag will be provided
                    keymap('n',         '<leader>sb',       ':Telescope file_history backup tag=',                                              hotkey_default_opts)

                -- q or Esc in      = Close telescope (telescope has normal and insert modes. these hotkeys are in normal mode)
               

            -- Basic hotkeys in file explorer
            
                -- R                = Refresh
                
                -- a                = Create
                
                -- x                = Cut 

                -- d                = Delete 

                -- c                = Copy

                -- p                = Paste

                -- q                = Close

                -- r                = Rename

                -- S                = Search

                
            -- Advanced hotkeys

                -- y                = Copy name

                -- Y                = Copy relative path

                -- gy               = Copy absolute path

                -- Tab              = Open file preview

                -- u                = Rename: full path

                
            -- Navigation hotkeys

                -- U                = Toggle fillter: Hidden

                -- P                = Go to parent directory

                -- R                = Refresh file explorer

                -- E                = Expand all

                -- W                = Collapse


            -- Selection (bookmarks)

                -- m                = Toggle bookmark

                -- bd               = Delete bookmarked

                -- bmv              = Move   bookmarked


        -- LSP - autocomplete and other launguage-specific features (nvim-lspconfig)

            -- Ctrl + o             = Leave Go to and Help modes below

            -- g + d                = Go to definition
                keymap('n',             'gd',               '<Cmd>lua vim.lsp.buf.definition()<CR>',                                            hotkey_default_opts)

            -- g + i                = Go to implementation
                keymap('n',             'gi',               '<Cmd>lua vim.lsp.buf.implementation()<CR>',                                        hotkey_default_opts)

            -- Space + H            = Help: Toast with docs about object under the cursor
                keymap('n',             '<leader>h',        '<Cmd>lua vim.lsp.buf.hover()<CR>',                                                 hotkey_default_opts)

            -- Space + r + n        = Rename object under the cursor
                keymap('n',             '<leader>rn',       '<Cmd>lua vim.lsp.buf.rename()<CR>',                                                hotkey_default_opts)

            -- Autocomplete (nvim-cmp) (keymaps are set in lsp.lua)

                -- Ctrl + C         = On/Off autocomplete

                -- Tab/Shift-Tab    = Choose autocomplete option


            -- Debugger (nvim-dap & nvim-dap-ui)

                local dap = require('dap')

                -- Space + d + q            = Quit debugger                            (debug quit)
                    require("config.scripts.dap-close-all-windows.functions")
                    keymap('n',          '<leader>dq',      ':lua dap_close_all_windows()<CR>',                                                 hotkey_default_opts)

                -- Space + d + t            = Toggle debugger terminal                 (debug terminal)
                    keymap('n',          '<leader>dt',      ':DapToggleRepl<CR>',                                                               hotkey_default_opts)

                -- Breakpoints

                    -- Space + d + p        = Next debug point                         (debug point)
                        keymap('n',     '<leader>dp',       dap.continue,                                                                       hotkey_default_opts)

                    -- Space + d + b        = Toggle breakpoint                        (debug breakpoint)
                        require("config.scripts.dap-toggle-breakpoints-in-visual-mode.function")
                        keymap('n',     '<leader>db',       dap.toggle_breakpoint,                                                              hotkey_default_opts)
                        keymap('v',     '<leader>db',       ':lua dap_toggle_breakpoints_in_visual_mode()<CR>',                                 hotkey_default_opts)

                    -- Space + d + c        = Clear all breakpoints                    (debug clear)
                        keymap('n',     '<leader>dc',       dap.clear_breakpoints,                                                              hotkey_default_opts)


                -- Step-by-step

                    -- Space + d + o        = Next step over function call             (debug over)
                        keymap('n',     '<leader>do',       dap.step_over,                                                                      hotkey_default_opts)

                    -- Space + d + i        = Next step into function call             (debug into)
                        keymap('n',     '<leader>di',       dap.step_into,                                                                      hotkey_default_opts)

                    -- Space + d + e        = Escape from function                     (debug escape)
                        keymap('n',     '<leader>de',       dap.step_out,                                                                       hotkey_default_opts)

                
                -- Switch between dapui windows

                    function focus_on_window(index)
                          vim.cmd(index .. "wincmd w") end

                    -- Space + d + s = Debugger stacks                 (debug stacks)
                        keymap('n',     '<Leader>ds',       ":lua focus_on_window(2)<CR>",                                                      hotkey_default_opts)

                    -- Space + d + v = Debugger scopes                 (debug variables)
                        keymap('n',     '<Leader>dv',       ":lua focus_on_window(1)<CR>",                                                      hotkey_default_opts)

                    -- Space + d + l = Debugger breakpoints            (debug list)
                        keymap('n',     '<Leader>dl',       ":lua focus_on_window(3)<CR>",                                                      hotkey_default_opts)

                    -- Space + d + m = Back to main window             (debug main)
                        keymap('n',     '<Leader>dm',       ":lua focus_on_window(4)<CR>",                                                      hotkey_default_opts)


        -- Comment lines (comment-nvim)

            -- g + c + c            = Toggle line   comment (Normal mode)

            -- g + c                = Toggle line   comment (Visual mode)

            -- g + c                = Toggle block  comment (Visual mode)


