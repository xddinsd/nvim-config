-- Functions
local function mergeTables(...)
	local result = {}
	for _, tbl in ipairs({ ... }) do
		for key, value in pairs(tbl) do
			result[key] = value
		end
	end
	return result
end

-- Variables

local keymap = vim.keymap.set

local opts_silent_noremap = { noremap = true, silent = true }
local opts_noremap = { noremap = true }

-- Vim hotkeys
-- Removing without copy            for p, d, x
-- Removing with    copy as usual   for P, D, X
keymap("v", "p", '"_dP', mergeTables(opts_silent_noremap, { desc = "Paste" }))

keymap({ "n", "v" }, "d", '"_d', mergeTables(opts_silent_noremap, { desc = "Delete" }))

keymap({ "n", "v" }, "x", '"_x', mergeTables(opts_silent_noremap, { desc = "Cut" }))

keymap("v", "P", '"p', mergeTables(opts_silent_noremap, { desc = "Paste and copy selected area" }))

keymap({ "n", "v" }, "D", "d", mergeTables(opts_silent_noremap, { desc = "Delete and copy selected area" }))

keymap({ "n", "v" }, "X", "x", mergeTables(opts_silent_noremap, { desc = "Cut and copy selected area" }))

-- Nvim shortcuts

keymap("n", "<leader>w", ":wq<CR>", mergeTables(opts_silent_noremap, { desc = "Save file & quit" }))

keymap("n", "<leader>q", ":q!<CR>", mergeTables(opts_silent_noremap, { desc = "Quit (no save)" }))

keymap("n", "<leader>e", ":w<CR>", mergeTables(opts_silent_noremap, { desc = "Save file" }))

keymap("n", "<C-/>", ":noh<CR>", mergeTables(opts_silent_noremap, { desc = "Deselect" }))

keymap("n", "<leader>bq", ":bd!<CR>", mergeTables(opts_silent_noremap, { desc = "Quit buffer" }))

keymap("n", "<C-CR>", "mzO<esc>`z", mergeTables(opts_silent_noremap, { desc = "Add new line above current line" }))

keymap("n", "<CR>", "mzo<esc>`z", mergeTables(opts_silent_noremap, { desc = "Add new line below current line" }))

keymap("v", "J", ":m '>+1<CR>gv=gv", mergeTables(opts_silent_noremap, { desc = "Move selected line up" }))

keymap("v", "K", ":m '<-2<CR>gv=gv", mergeTables(opts_silent_noremap, { desc = "Move selected line down" }))
keymap("n", "<C-j>", "<C-d>zz", mergeTables(opts_silent_noremap, { desc = "Scroll one page down" }))

keymap("n", "<C-k>", "<C-u>zz", mergeTables(opts_silent_noremap, { desc = "Scroll one page up" }))

keymap("n", "n", "nzzzv", mergeTables(opts_silent_noremap, { desc = "[Search] Next word" }))

keymap("n", "N", "Nzzzv", mergeTables(opts_silent_noremap, { desc = "[Search] Previous word" }))

-- Plugin hotkeys
-- Hotkeys popup (which-key)
keymap(
	{ "n", "v" },
	"<C-h>",
	':lua require("which-key").show({ global = true, loop = true }) <CR>',
	mergeTables(opts_silent_noremap, { desc = "Show hotkeys popup" })
)

-- File-explorer(nvim-tree)

keymap(
	"n",
	"<leader>fe",
	":NvimTreeToggle<CR>",
	mergeTables(opts_silent_noremap, { desc = "[File explorer] Toggle file explorer" })
)

keymap(
	"n",
	"<leader>gf",
	":NvimTreeFindFile<CR>",
	mergeTables(opts_silent_noremap, { desc = "[File explorer] Find current file in file explorer" })
)

require("config.scripts.open-nvim-tree-file-in-new-terminal.functions")
keymap(
	"n",
	"<leader><CR>",
	":lua save_dir_under_nvim_tree_cursor(); open_file_in_nvim_in_new_terminal()<CR>:NvimTreeToggle<CR>",
	mergeTables(opts_silent_noremap, { desc = "[File explorer] Open file in nvim in new terminal" })
)

require("config.scripts.open-nvim-tree-file-in-new-terminal.functions")
keymap(
	"n",
	"<leader>t<CR>",
	":lua save_dir_under_nvim_tree_cursor(); open_folder_in_new_terminal()<CR>:NvimTreeToggle<CR>",
	mergeTables(opts_silent_noremap, { desc = "[File explorer] Open folder in new terminal" })
)

keymap(
	"n",
	"<leader>cd",
	':lua require("nvim-tree.api").tree.change_root_to_node()<CR>',
	mergeTables(opts_silent_noremap, { desc = "[File explorer] cd to selected directory" })
)

-- File search (telescope.nvim)

require("config.scripts.telescope-find-files-in-nvim-tree.functions")
keymap(
	"n",
	"<leader>ff",
	":lua telescope_find_files_in_nvim_tree()<CR>",
	mergeTables(opts_silent_noremap, { desc = "[File explorer search] Find by filename" })
)

require("config.scripts.telescope-find-files-in-nvim-tree.functions")
keymap(
	"n",
	"<leader>fg",
	":lua telescope_grep_files_in_nvim_tree()<CR>",
	mergeTables(opts_silent_noremap, { desc = "[File explorer search] Find file by contents (grep-like)" })
)

-- File history (telescope-file-history.nvim)
keymap(
	"n",
	"<leader>sh",
	":Telescope file_history history<CR>",
	mergeTables(opts_silent_noremap, { desc = "[File history] Show file history" })
)

keymap(
	"n",
	"<leader>sb",
	":Telescope file_history backup tag=",
	mergeTables(opts_noremap, { desc = "[File history] Create a backup with a tag" })
)

keymap(
	"n",
	"<leader>rb",
	-- Copy all with :%y, :bd! to exit buffer, gg to go to the first line, VG to select all file and _p to paste
	":%y<CR>:bd!<CR>ggVG_p",
	mergeTables(opts_silent_noremap, { desc = "[File history] Revert backup - when backup buffer is opened" })
)

-- LSP - autocomplete and other launguage-specific features (nvim-lspconfig)

keymap(
	"n",
	"gd",
	"<Cmd>lua vim.lsp.buf.definition()<CR>",
	mergeTables(opts_silent_noremap, { desc = "[LSP] Go to definition" })
)

keymap(
	"n",
	"gi",
	"<Cmd>lua vim.lsp.buf.implementation()<CR>",
	mergeTables(opts_silent_noremap, { desc = "[LSP] Go to implementation" })
)

keymap(
	"n",
	"<leader>h",
	"<Cmd>lua vim.lsp.buf.hover()<CR>",
	mergeTables(opts_silent_noremap, { desc = "[LSP] Show docs toast of object under the cursor" })
)

keymap(
	"n",
	"<leader>rn",
	"<Cmd>lua vim.lsp.buf.rename()<CR>",
	mergeTables(opts_silent_noremap, { desc = "[LSP] Rename object under the cursor" })
)

require("config.scripts.lsp-cycle-linter-severity.function")
keymap(
	"n",
	"<leader>ls",
	":lua lsp_cycle_linter_severity()<CR>",
	mergeTables(opts_silent_noremap, { desc = "[LSP] Cycle linter severity (Info/Warning/Error)" })
)

-- Autocomplete
-- Tab, Shift-tab and Esc = Choose autocomplete options ( defined in plugins.lsp )
require("config.scripts.toggle-autocomplete.functions")
keymap(
	"n",
	"<leader>a",
	":lua toggle_autocomplete() <CR>",
	mergeTables(opts_silent_noremap, { desc = "[LSP] Toggle autocomplete" })
)

-- Debugger (nvim-dap & nvim-dap-ui)

local dap = require("dap")

require("config.scripts.dap-close-all-windows.functions")
keymap(
	"n",
	"<leader>dq",
	":lua dap_close_all_windows()<CR>",
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Quit" })
)

keymap(
	"n",
	"<leader>dt",
	":DapToggleRepl<CR>",
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Toggle terminal" })
)

keymap(
	"n",
	"<leader>dp",
	dap.continue,
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Go to next debug point" })
)

require("config.scripts.dap-toggle-breakpoints-in-visual-mode.function")
keymap(
	"n",
	"<leader>db",
	dap.toggle_breakpoint,
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Toggle breakpoint" })
)

keymap(
	"v",
	"<leader>db",
	":lua dap_toggle_breakpoints_in_visual_mode()<CR>",
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Toggle breakpoint multi-line" })
)

keymap(
	"n",
	"<leader>dc",
	dap.clear_breakpoints,
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Clear all breakpoints" })
)

keymap(
	"n",
	"<leader>do",
	dap.step_over,
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Next step over function call" })
)

keymap(
	"n",
	"<leader>di",
	dap.step_into,
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Next step into function call" })
)

keymap(
	"n",
	"<leader>de",
	dap.step_out,
	mergeTables(opts_silent_noremap, {
		desc = "[Debugger] Escape from function",
	})
)

function focus_on_window(index)
	vim.cmd(index .. "wincmd w")
end

keymap(
	"n",
	"<Leader>ds",
	":lua focus_on_window(2)<CR>",
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Go to stacks window" })
)

keymap(
	"n",
	"<Leader>dv",
	":lua focus_on_window(1)<CR>",
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Go to scopes window" })
)

keymap(
	"n",
	"<Leader>dl",
	":lua focus_on_window(3)<CR>",
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Go to breakpoints list window" })
)

keymap(
	"n",
	"<Leader>dm",
	":lua focus_on_window(4)<CR>",
	mergeTables(opts_silent_noremap, { desc = "[Debugger] Go to main window" })
)

-- Nvim in browser support (firenvim)
keymap(
	"n",
	"<Leader>sl",
	":set lines=",
	mergeTables(opts_noremap, { desc = "[Nvim-in-browser] Set window number of lines manually" })
)
