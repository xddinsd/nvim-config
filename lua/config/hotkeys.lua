-- Functions
--
local function mergeTables(...)
  local result = {}
  for _, tbl in ipairs({...}) do
    for key, value in pairs(tbl) do
      result[key] = value           end end
  return result                             end

-- Hotkeys
    local keymap              = vim.keymap.set
    local hotkey_default_opts = { noremap = true, silent = true }

    -- Vim hotkeys
        -- Removing without copy            for p, d, x
        -- Removing with    copy as usual   for P, D, X
            keymap(
                'v',
                'p',
                '"_dP',
                mergeTables(
                    hotkey_default_opts,
                    { desc = 'Paste'  } )   )
            keymap(
                {'n', 'v'},
                'd',
                '"_d',
                mergeTables(
                    hotkey_default_opts,
                    { desc = 'Delete' } )   )
            keymap(
                {'n', 'v'},
                'x',
                '"_x',
                mergeTables(
                    hotkey_default_opts,
                    { desc = 'Cut'    } )   )
            keymap(
                'v',
                'P',
                '"p',
                mergeTables(
                    hotkey_default_opts,
                    { desc = 'Paste and copy selected area'   } )   )
            keymap(
                {'n', 'v'},
                'D',
                'd',
                mergeTables(
                    hotkey_default_opts,
                    { desc = 'Delete and copy selected area'  } )   )
            keymap(
                {'n', 'v'},
                'X',
                'x',
                mergeTables(
                    hotkey_default_opts,
                    { desc = 'Cut and copy selected area'     } )   )


    -- Nvim shortcuts
        keymap(
            'n',
            '<C-/>',
            ':noh<CR>',
            mergeTables(
                hotkey_default_opts,
                { desc = 'Deselect'     } )   )

        keymap(
            'n',
            '<leader>bq',
            ':bd!<CR>',
            mergeTables(
                hotkey_default_opts,
                { desc = 'Quit buffer'  } )   )


    -- Plugin hotkeys
        -- Hotkeys popup (which-key)
            keymap(
                {'n', 'v'},
                '<C-h>',
                ':lua require("which-key").show({ global = true, loop = true }) <CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = 'Show hotkeys popup' } )   )

        -- File-explorer(nvim-tree)

            keymap(
                'n',
                '<leader>fe',
                ':NvimTreeToggle<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[File explorer] Toggle file explorer'                         } )                             )

            keymap(
                'n',
                '<leader>gf',
                ':NvimTreeFindFile<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[File explorer] Find current file in file explorer'           } )                             )

            require("config.scripts.open-nvim-tree-file-in-new-terminal.functions")
            keymap(
                'n',
                '<leader><CR>',
                ':lua save_dir_under_nvim_tree_cursor(); open_file_in_nvim_in_new_terminal()<CR>:NvimTreeToggle<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[File explorer] Open file in nvim in new terminal'            } )                             )

            require("config.scripts.open-nvim-tree-file-in-new-terminal.functions")
            keymap(
                'n',
                '<leader>t<CR>',
                ':lua save_dir_under_nvim_tree_cursor(); open_folder_in_new_terminal()<CR>:NvimTreeToggle<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[File explorer] Open folder in new terminal'                  } )                             )

            keymap(
                'n',
                '<leader>cd',
                ':lua require("nvim-tree.api").tree.change_root_to_node()<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[File explorer] cd to selected directory'                     } )                             )


            -- File search (telescope.nvim)

                require("config.scripts.telescope-find-files-in-nvim-tree.functions")
                keymap(
                    'n',
                    '<leader>ff',
                    ':lua telescope_find_files_in_nvim_tree()<CR>',
                    mergeTables(
                        hotkey_default_opts,
                        { desc = '[File explorer search] Find by filename'                  } )  )

                require("config.scripts.telescope-find-files-in-nvim-tree.functions")
                keymap(
                    'n',
                    '<leader>fg',
                    ':lua telescope_grep_files_in_nvim_tree()<CR>',
                    mergeTables(
                        hotkey_default_opts,
                        { desc = '[File explorer search] Find file by contents (grep-like)' } )   )


            -- File history (telescope-file-history.nvim)
                keymap(
                    'n',
                    '<leader>sh',
                    ':Telescope file_history history<CR>',
                    mergeTables(
                        hotkey_default_opts,
                        { desc = '[File history] Show file history'                         } )    )


                keymap(
                    'n',
                    '<leader>sb',
                    ':Telescope file_history backup tag=',
                    mergeTables(
                        hotkey_default_opts,
                        { desc = '[File history] Create a backup with a tag'                } )     )




        -- LSP - autocomplete and other launguage-specific features (nvim-lspconfig)

            keymap(
                'n',
                'gd',
                '<Cmd>lua vim.lsp.buf.definition()<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[LSP] Go to definition'                           } )   )

            keymap(
                'n',
                'gi',
                '<Cmd>lua vim.lsp.buf.implementation()<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[LSP] Go to implementation'                       } )   )

            keymap(
                'n',
                '<leader>h',
                '<Cmd>lua vim.lsp.buf.hover()<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[LSP] Show docs toast of object under the cursor' } )   )

            keymap(
                'n',
                '<leader>rn',
                '<Cmd>lua vim.lsp.buf.rename()<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[LSP] Rename object under the cursor'             } )   )

            require("config.scripts.lsp-cycle-linter-severity.function")
            keymap(
                'n',
                '<leader>ls',
                ':lua lsp_cycle_linter_severity()<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[LSP] Cycle linter severity (Info/Warning/Error)' } )   )

            -- Autocomplete
                -- Tab, Shift-tab and Esc = Choose autocomplete options ( defined in plugins.lsp )
                require("config.scripts.toggle-autocomplete.functions")
                keymap(
                    'n',
                    '<leader>a',
                    ':lua toggle_autocomplete() <CR>',
                    mergeTables(
                        hotkey_default_opts,
                        { desc = '[LSP] Toggle autocomplete'                    } )    )


        -- Debugger (nvim-dap & nvim-dap-ui)

            local dap = require('dap')

            require("config.scripts.dap-close-all-windows.functions")
            keymap(
                'n',
                '<leader>dq',
                ':lua dap_close_all_windows()<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Quit'                          } )   )

            keymap(
                'n',
                '<leader>dt',
                ':DapToggleRepl<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Toggle terminal'               } )   )

            keymap(
                'n',
                '<leader>dp',
                dap.continue,
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Go to next debug point'        } )   )

            require("config.scripts.dap-toggle-breakpoints-in-visual-mode.function")
            keymap(
                'n',
                '<leader>db',
                dap.toggle_breakpoint,
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Toggle breakpoint'             } )   )

            keymap(
                'v',
                '<leader>db',
                ':lua dap_toggle_breakpoints_in_visual_mode()<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Toggle breakpoint multi-line'  } )   )

            keymap(
                'n',
                '<leader>dc',
                dap.clear_breakpoints,
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Clear all breakpoints'         } )   )

            keymap(
                'n',
                '<leader>do',
                dap.step_over,
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Next step over function call'  } )   )

            keymap(
                'n',
                '<leader>di',
                dap.step_into,
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Next step into function call'  } )   )

            keymap(
                'n',
                '<leader>de',
                dap.step_out,
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Escape from function'          } )   )



            function focus_on_window(index)
                  vim.cmd(index .. "wincmd w") end

            keymap(
                'n',
                '<Leader>ds',
                ':lua focus_on_window(2)<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Go to stacks window'           } )   )

            keymap(
                'n',
                '<Leader>dv',
                ':lua focus_on_window(1)<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Go to scopes window'           } )   )

            keymap(
                'n',
                '<Leader>dl',
                ':lua focus_on_window(3)<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Go to breakpoints list window' } )   )

            keymap(
                'n',
                '<Leader>dm',
                ':lua focus_on_window(4)<CR>',
                mergeTables(
                    hotkey_default_opts,
                    { desc = '[Debugger] Go to main window'             } )   )



