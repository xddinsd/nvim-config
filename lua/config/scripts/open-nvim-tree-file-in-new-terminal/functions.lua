
local folderPath    = os.getenv("HOME") .. "/.config/nvim/lua/config/scripts/open-nvim-tree-file-in-new-terminal"

function save_dir_under_nvim_tree_cursor()
    -- Get file and folder dirs from cursor in nvim-tree

    local api           = require'nvim-tree.api'
    local node          = api.tree.get_node_under_cursor()

    if not node or not node.absolute_path then
        print("Warning: No file selected in nvim-tree")
        return end

    local file_path = node.absolute_path
    local dir_path  = vim.fn.fnamemodify(file_path, ":h") 

    local variable_file_path = folderPath .. "/.file_paths.conf"

    -- Save dirs to 'file_paths.conf'
    local variable_file = io.open(variable_file_path, "w")
    if variable_file then
        variable_file:write(string.format('DIR_PATH="%s"\n', dir_path))
        variable_file:write(string.format('FILE_PATH="%s"\n', file_path))
        variable_file:close() 
    else
        print("OpenFileInNvimInNewTerminal: Could not write dirs to " .. variable_file_path)
        return end end

function open_folder_in_new_terminal()
    -- Execute alacritty using an option to open 'openNvimInNewTerminal.sh'
    os.execute("alacritty -o 'terminal.shell.program=\"" .. folderPath .. "/openAlacritty.sh"     .. "\"'" .. " &") end


function open_file_in_nvim_in_new_terminal()
    -- Execute alacritty using an option to open 'openNvimInNewTerminal.sh'
    os.execute("alacritty -o 'terminal.shell.program=\"" .. folderPath .. "/openAlacrittyNvim.sh" .. "\"'" .. " &") end
