function telescope_find_files_in_nvim_tree()
    -- Получаем путь текущей корневой директории дерева
    local node = require('nvim-tree.api').tree.get_node_under_cursor()
    if node then
        require('telescope.builtin').find_files({ cwd = node.absolute_path })
    else
        print("No folder to find is selected in nvim-tree") end end

-- Функция для выполнения live_grep в корневой директории nvim-tree
function telescope_grep_files_in_nvim_tree()
    -- Получаем путь текущей корневой директории дерева
    local node = require('nvim-tree.api').tree.get_node_under_cursor()
    if node then
        require('telescope.builtin').live_grep({ cwd = node.absolute_path })
    else
        print("No folder to find is selected in nvim-tree") end end
