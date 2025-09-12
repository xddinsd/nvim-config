-- ================================================================================
-- NEOVIM DATA ENGINEERING IDE - KEYMAPS
-- ================================================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ================================================================================
-- GENERAL KEYMAPS
-- ================================================================================

-- Better up/down
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Buffer navigation
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Lazy
keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- New file
keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Save file
keymap({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Quit
keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Highlights under cursor
keymap("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- ================================================================================
-- LSP KEYMAPS
-- ================================================================================

keymap("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "References" })
keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
keymap("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
keymap("n", "gt", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
keymap("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
keymap("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
keymap("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

-- ================================================================================
-- DIAGNOSTICS
-- ================================================================================

keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
keymap("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })
keymap("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev Error" })
keymap("n", "]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Next Warning" })
keymap("n", "[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Prev Warning" })

-- ================================================================================
-- TELESCOPE
-- ================================================================================

keymap("n", "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", { desc = "Switch Buffer" })
keymap("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Grep (root dir)" })
keymap("n", "<leader>:", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
keymap("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Find Files (root dir)" })
-- find
keymap("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", { desc = "Buffers" })
keymap("n", "<leader>fc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", { desc = "Find Config File" })
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files (root dir)" })
keymap("n", "<leader>fF", "<cmd>Telescope find_files cwd=%:p:h<cr>", { desc = "Find Files (cwd)" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent" })
keymap("n", "<leader>fR", "<cmd>Telescope oldfiles cwd=%:p:h<cr>", { desc = "Recent (cwd)" })
-- git
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "commits" })
keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "status" })
-- search
keymap("n", '<leader>s"', "<cmd>Telescope registers<cr>", { desc = "Registers" })
keymap("n", "<leader>sa", "<cmd>Telescope autocommands<cr>", { desc = "Auto Commands" })
keymap("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buffer" })
keymap("n", "<leader>sc", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
keymap("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
keymap("n", "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document diagnostics" })
keymap("n", "<leader>sD", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace diagnostics" })
keymap("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Grep (root dir)" })
keymap("n", "<leader>sG", "<cmd>Telescope live_grep cwd=%:p:h<cr>", { desc = "Grep (cwd)" })
keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages" })
keymap("n", "<leader>sH", "<cmd>Telescope highlights<cr>", { desc = "Search Highlight Groups" })
keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps" })
keymap("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
keymap("n", "<leader>sm", "<cmd>Telescope marks<cr>", { desc = "Jump to Mark" })
keymap("n", "<leader>so", "<cmd>Telescope vim_options<cr>", { desc = "Options" })
keymap("n", "<leader>sR", "<cmd>Telescope resume<cr>", { desc = "Resume" })
keymap("n", "<leader>sw", "<cmd>Telescope grep_string word_match=-w<cr>", { desc = "Word (root dir)" })
keymap("n", "<leader>sW", "<cmd>Telescope grep_string cwd=%:p:h word_match=-w<cr>", { desc = "Word (cwd)" })
keymap("v", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Selection (root dir)" })
keymap("v", "<leader>sW", "<cmd>Telescope grep_string cwd=%:p:h<cr>", { desc = "Selection (cwd)" })
keymap("n", "<leader>uC", "<cmd>Telescope colorscheme enable_preview=true<cr>", { desc = "Colorscheme with preview" })
keymap("n", "<leader>ss", function()
	require("telescope.builtin").lsp_document_symbols({
		symbols = {
			"Class",
			"Function",
			"Method",
			"Constructor",
			"Interface",
			"Module",
			"Struct",
			"Trait",
			"Field",
			"Property",
		},
	})
end, { desc = "Goto Symbol" })
keymap("n", "<leader>sS", function()
	require("telescope.builtin").lsp_dynamic_workspace_symbols({
		symbols = {
			"Class",
			"Function",
			"Method",
			"Constructor",
			"Interface",
			"Module",
			"Struct",
			"Trait",
			"Field",
			"Property",
		},
	})
end, { desc = "Goto Symbol (Workspace)" })

-- Projects
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Projects" })

-- File History
keymap("n", "<leader>fh", "<cmd>Telescope file_history<cr>", { desc = "File History" })

-- ================================================================================
-- NVIM-TREE
-- ================================================================================

keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" })
keymap("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>", { desc = "Explorer (current file)" })

-- ================================================================================
-- TOGGLETERM
-- ================================================================================

keymap("n", "<leader>t", "", { desc = "+terminal" })
keymap("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal (float)" })
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Terminal (horizontal)" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Terminal (vertical)" })
keymap("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", { desc = "Node" })
keymap("n", "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", { desc = "NCDU" })
keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", { desc = "Python" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical" })

-- ================================================================================
-- GIT INTEGRATION
-- ================================================================================

keymap("n", "<leader>g", "", { desc = "+git" })
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", { desc = "Lazygit" })
keymap(
	"n",
	"<leader>gj",
	"<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
	{ desc = "Next Hunk" }
)
keymap(
	"n",
	"<leader>gk",
	"<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
	{ desc = "Prev Hunk" }
)
keymap("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
keymap("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
keymap("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
keymap("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Reset Buffer" })
keymap("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
keymap("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Undo Stage Hunk" })
keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Git Diff" })

-- ================================================================================
-- TROUBLE
-- ================================================================================

keymap("n", "<leader>x", "", { desc = "+trouble" })
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
keymap(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
keymap("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- ================================================================================
-- FLASH (ENHANCED NAVIGATION)
-- ================================================================================

keymap({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
keymap({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
keymap("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })
keymap({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
keymap({ "c" }, "<c-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- ================================================================================
-- HARPOON
-- ================================================================================

keymap("n", "<leader>h", "", { desc = "+harpoon" })
keymap("n", "<leader>ha", function()
	require("harpoon"):list():add()
end, { desc = "Add file" })
keymap("n", "<leader>hh", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Toggle quick menu" })
keymap("n", "<leader>h1", function()
	require("harpoon"):list():select(1)
end, { desc = "Go to file 1" })
keymap("n", "<leader>h2", function()
	require("harpoon"):list():select(2)
end, { desc = "Go to file 2" })
keymap("n", "<leader>h3", function()
	require("harpoon"):list():select(3)
end, { desc = "Go to file 3" })
keymap("n", "<leader>h4", function()
	require("harpoon"):list():select(4)
end, { desc = "Go to file 4" })
keymap("n", "<leader>hp", function()
	require("harpoon"):list():prev()
end, { desc = "Previous file" })
keymap("n", "<leader>hn", function()
	require("harpoon"):list():next()
end, { desc = "Next file" })

-- ================================================================================
-- SEARCH AND REPLACE (GRUG-FAR)
-- ================================================================================

keymap("n", "<leader>sr", "<cmd>GrugFar<cr>", { desc = "Search and Replace" })
keymap("v", "<leader>sr", function()
	local grug = require("grug-far")
	local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
	grug.open({
		transient = true,
		prefills = {
			filesFilter = ext and ext ~= "" and "*." .. ext or nil,
		},
	})
end, { desc = "Search and Replace" })

-- ================================================================================
-- FORMATTING
-- ================================================================================

keymap({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format" })

-- ================================================================================
-- TESTING (NEOTEST)
-- ================================================================================

keymap("n", "<leader>T", "", { desc = "+test" })
keymap("n", "<leader>Tt", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run File" })
keymap("n", "<leader>TT", function()
	require("neotest").run.run(vim.loop.cwd())
end, { desc = "Run All Test Files" })
keymap("n", "<leader>Tr", function()
	require("neotest").run.run()
end, { desc = "Run Nearest" })
keymap("n", "<leader>Tl", function()
	require("neotest").run.run_last()
end, { desc = "Run Last" })
keymap("n", "<leader>Ts", function()
	require("neotest").summary.toggle()
end, { desc = "Toggle Summary" })
keymap("n", "<leader>To", function()
	require("neotest").output.open({ enter = true, auto_close = true })
end, { desc = "Show Output" })
keymap("n", "<leader>TO", function()
	require("neotest").output_panel.toggle()
end, { desc = "Toggle Output Panel" })
keymap("n", "<leader>TS", function()
	require("neotest").run.stop()
end, { desc = "Stop" })
keymap("n", "<leader>Tw", function()
	require("neotest").watch.toggle(vim.fn.expand("%"))
end, { desc = "Toggle Watch" })

-- ================================================================================
-- DEBUGGING (DAP)
-- ================================================================================

keymap("n", "<leader>d", "", { desc = "+debug" })
keymap("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Breakpoint Condition" })
keymap("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
keymap("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "Continue" })
keymap("n", "<leader>dC", function()
	require("dap").run_to_cursor()
end, { desc = "Run to Cursor" })
keymap("n", "<leader>dg", function()
	require("dap").goto_()
end, { desc = "Go to line (no execute)" })
keymap("n", "<leader>di", function()
	require("dap").step_into()
end, { desc = "Step Into" })
keymap("n", "<leader>dj", function()
	require("dap").down()
end, { desc = "Down" })
keymap("n", "<leader>dk", function()
	require("dap").up()
end, { desc = "Up" })
keymap("n", "<leader>dl", function()
	require("dap").run_last()
end, { desc = "Run Last" })
keymap("n", "<leader>do", function()
	require("dap").step_out()
end, { desc = "Step Out" })
keymap("n", "<leader>dO", function()
	require("dap").step_over()
end, { desc = "Step Over" })
keymap("n", "<leader>dp", function()
	require("dap").pause()
end, { desc = "Pause" })
keymap("n", "<leader>dr", function()
	require("dap").repl.toggle()
end, { desc = "Toggle REPL" })
keymap("n", "<leader>ds", function()
	require("dap").session()
end, { desc = "Session" })
keymap("n", "<leader>dt", function()
	require("dap").terminate()
end, { desc = "Terminate" })
keymap("n", "<leader>dw", function()
	require("dap.ui.widgets").hover()
end, { desc = "Widgets" })

-- DAP UI
keymap("n", "<leader>du", function()
	require("dapui").toggle({})
end, { desc = "Dap UI" })
keymap("n", "<leader>de", function()
	require("dapui").eval()
end, { desc = "Eval" })

-- ================================================================================
-- COVERAGE
-- ================================================================================

keymap("n", "<leader>C", "", { desc = "+coverage" })
keymap("n", "<leader>Cl", function()
	require("coverage").load(true)
end, { desc = "Load Coverage" })
keymap("n", "<leader>Cs", function()
	require("coverage").summary()
end, { desc = "Coverage Summary" })
keymap("n", "<leader>Ct", function()
	require("coverage").toggle()
end, { desc = "Toggle Coverage" })

-- ================================================================================
-- SESSIONS
-- ================================================================================

keymap("n", "<leader>qs", function()
	require("persistence").load()
end, { desc = "Restore Session" })
keymap("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })
keymap("n", "<leader>qd", function()
	require("persistence").stop()
end, { desc = "Don't Save Current Session" })

-- ================================================================================
-- FOLDING (UFO)
-- ================================================================================

keymap("n", "zR", function()
	require("ufo").openAllFolds()
end, { desc = "Open all folds" })
keymap("n", "zM", function()
	require("ufo").closeAllFolds()
end, { desc = "Close all folds" })
keymap("n", "zr", function()
	require("ufo").openFoldsExceptKinds()
end, { desc = "Fold less" })
keymap("n", "zm", function()
	require("ufo").closeFoldsWith()
end, { desc = "Fold more" })
keymap("n", "zp", function()
	require("ufo").peekFoldedLinesUnderCursor()
end, { desc = "Peek fold" })

-- ================================================================================
-- CODEWINDOW (MINIMAP)
-- ================================================================================

keymap("n", "<leader>mo", function()
	require("codewindow").open_minimap()
end, { desc = "Open minimap" })
keymap("n", "<leader>mc", function()
	require("codewindow").close_minimap()
end, { desc = "Close minimap" })
keymap("n", "<leader>mf", function()
	require("codewindow").toggle_focus()
end, { desc = "Focus minimap" })
keymap("n", "<leader>mm", function()
	require("codewindow").toggle_minimap()
end, { desc = "Toggle minimap" })

-- ================================================================================
-- UI TOGGLES
-- ================================================================================

keymap("n", "<leader>u", "", { desc = "+ui" })
keymap("n", "<leader>ub", function()
	vim.o.background = vim.o.background == "dark" and "light" or "dark"
	print("Background: " .. vim.o.background)
end, { desc = "Toggle Background" })
keymap("n", "<leader>uc", function()
	local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
	vim.o.conceallevel = vim.o.conceallevel == 0 and conceallevel or 0
	print("conceallevel: " .. vim.o.conceallevel)
end, { desc = "Toggle Conceal" })
keymap("n", "<leader>ud", function()
	if vim.diagnostic.is_disabled() then
		vim.diagnostic.enable()
		print("Enabled diagnostics")
	else
		vim.diagnostic.disable()
		print("Disabled diagnostics")
	end
end, { desc = "Toggle Diagnostics" })
keymap("n", "<leader>uf", function()
	local enabled = vim.g.autoformat == nil and true or vim.g.autoformat
	if enabled then
		vim.g.autoformat = false
		print("Disabled format on save")
	else
		vim.g.autoformat = true
		print("Enabled format on save")
	end
end, { desc = "Toggle format on Save" })
keymap("n", "<leader>uh", function()
	if vim.lsp.inlay_hint.is_enabled(0) then
		vim.lsp.inlay_hint.enable(0, false)
		print("Disabled inlay hints")
	else
		vim.lsp.inlay_hint.enable(0, true)
		print("Enabled inlay hints")
	end
end, { desc = "Toggle Inlay Hints" })
keymap("n", "<leader>ul", function()
	if vim.wo.number then
		vim.wo.number = false
		vim.wo.relativenumber = false
		print("Disabled line numbers")
	else
		vim.wo.number = true
		vim.wo.relativenumber = true
		print("Enabled line numbers")
	end
end, { desc = "Toggle Line Numbers" })
keymap("n", "<leader>us", function()
	if vim.o.spell then
		vim.o.spell = false
		print("Disabled spell")
	else
		vim.o.spell = true
		print("Enabled spell")
	end
end, { desc = "Toggle Spelling" })
keymap("n", "<leader>ut", function()
	if vim.b.ts_highlight then
		vim.treesitter.stop(0)
		print("Disabled treesitter")
	else
		vim.treesitter.start(0)
		print("Enabled treesitter")
	end
end, { desc = "Toggle Treesitter Highlight" })
keymap("n", "<leader>uw", function()
	if vim.wo.wrap then
		vim.wo.wrap = false
		print("Disabled wrap")
	else
		vim.wo.wrap = true
		print("Enabled wrap")
	end
end, { desc = "Toggle Word Wrap" })

-- ================================================================================
-- WINDOW MANAGEMENT
-- ================================================================================

keymap("n", "<leader>w", "", { desc = "+windows" })
keymap("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
keymap("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
keymap("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
keymap("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
keymap("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
keymap("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- ================================================================================
-- TABS
-- ================================================================================

keymap("n", "<leader><tab>", "", { desc = "+tabs" })
keymap("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
keymap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
keymap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
keymap("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- ================================================================================
-- DATA ENGINEERING SPECIFIC KEYMAPS
-- ================================================================================

keymap("n", "<leader>D", "", { desc = "+data-engineering" })

-- Python Data Science
keymap("n", "<leader>Dp", "", { desc = "+python" })
keymap("n", "<leader>Dpr", "<cmd>lua require('dap-python').test_method()<cr>", { desc = "Test Method" })
keymap("n", "<leader>Dpc", "<cmd>lua require('dap-python').test_class()<cr>", { desc = "Test Class" })
keymap("n", "<leader>Dps", "<cmd>lua require('dap-python').debug_selection()<cr>", { desc = "Debug Selection" })

-- SQL/Database
keymap("n", "<leader>Ds", "", { desc = "+sql" })
keymap("n", "<leader>Dse", "<cmd>SqlsExecuteQuery<cr>", { desc = "Execute Query" })
keymap("n", "<leader>Dsc", "<cmd>SqlsExecuteQueryVertical<cr>", { desc = "Execute Query Vertical" })
keymap("v", "<leader>Dse", "<cmd>SqlsExecuteQuery<cr>", { desc = "Execute Selection" })

-- Docker
keymap("n", "<leader>Dd", "", { desc = "+docker" })
keymap("n", "<leader>Ddb", "<cmd>!docker build -t %:t:r .<cr>", { desc = "Build Image" })
keymap("n", "<leader>Ddr", "<cmd>!docker run -it %:t:r<cr>", { desc = "Run Container" })
keymap("n", "<leader>Ddp", "<cmd>!docker ps<cr>", { desc = "List Containers" })

-- Kubernetes
keymap("n", "<leader>Dk", "", { desc = "+kubernetes" })
keymap("n", "<leader>Dka", "<cmd>!kubectl apply -f %<cr>", { desc = "Apply Resource" })
keymap("n", "<leader>Dkd", "<cmd>!kubectl delete -f %<cr>", { desc = "Delete Resource" })
keymap("n", "<leader>Dkp", "<cmd>!kubectl get pods<cr>", { desc = "Get Pods" })
keymap("n", "<leader>Dks", "<cmd>!kubectl get services<cr>", { desc = "Get Services" })

-- Big Data Tools
keymap("n", "<leader>Db", "", { desc = "+big-data" })
keymap("n", "<leader>Dbs", "<cmd>!spark-submit %<cr>", { desc = "Submit Spark Job" })
keymap("n", "<leader>Dbh", "<cmd>!hdfs dfs -ls<cr>", { desc = "List HDFS" })

-- API Testing
keymap("n", "<leader>Da", "", { desc = "+api" })
keymap("n", "<leader>Dat", "<cmd>!curl -X GET <C-r><C-w><cr>", { desc = "Test API Endpoint" })

-- ================================================================================
-- QUICK ACTIONS
-- ================================================================================

-- Quick save and format
keymap("n", "<leader><leader>", function()
	vim.cmd("write")
	require("conform").format({ lsp_fallback = true })
	print("File saved and formatted!")
end, { desc = "Save & Format" })

-- Quick search current word
keymap("n", "*", "*<C-o>", { desc = "Search word forward" })
keymap("n", "#", "#<C-o>", { desc = "Search word backward" })

-- Better paste in visual mode
keymap("v", "p", '"_dP', { desc = "Better paste" })

-- Add undo break-points
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

-- Center screen when navigating
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "*", "*zzzv")
keymap("n", "#", "#zzzv")
keymap("n", "g*", "g*zzzv")
keymap("n", "g#", "g#zzzv")

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- ================================================================================
-- COMPLETION & SNIPPETS
-- ================================================================================

-- Expand snippets with Tab in insert mode
keymap("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	elseif require("luasnip").expand_or_jumpable() then
		return "<Plug>luasnip-expand-or-jump"
	else
		return "<Tab>"
	end
end, { expr = true, silent = true })

keymap("s", "<Tab>", function()
	if require("luasnip").jumpable(1) then
		return "<Plug>luasnip-jump-next"
	else
		return "<Tab>"
	end
end, { expr = true, silent = true })

keymap({ "i", "s" }, "<S-Tab>", function()
	if require("luasnip").jumpable(-1) then
		return "<Plug>luasnip-jump-prev"
	else
		return "<S-Tab>"
	end
end, { expr = true, silent = true })

-- ================================================================================
-- CUSTOM FUNCTIONS
-- ================================================================================

-- Toggle between relative and absolute line numbers
keymap("n", "<leader>rn", function()
	vim.wo.relativenumber = not vim.wo.relativenumber
	print("Relative numbers: " .. (vim.wo.relativenumber and "enabled" or "disabled"))
end, { desc = "Toggle relative numbers" })

-- Copy file path to clipboard
keymap("n", "<leader>fp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("Copied path: " .. path)
end, { desc = "Copy file path" })

-- Copy file name to clipboard
keymap("n", "<leader>fn", function()
	local name = vim.fn.expand("%:t")
	vim.fn.setreg("+", name)
	print("Copied filename: " .. name)
end, { desc = "Copy file name" })

-- Reload config
keymap("n", "<leader>R", function()
	for name, _ in pairs(package.loaded) do
		if name:match("^cnf") and not name:match("nvim-tree") then
			package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
	print("Config reloaded!")
end, { desc = "Reload config" })

-- Toggle quickfix list
keymap("n", "<leader>q", function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
		end
	end
	if qf_exists == true then
		vim.cmd("cclose")
		return
	end
	if not vim.tbl_isempty(vim.fn.getqflist()) then
		vim.cmd("copen")
	end
end, { desc = "Toggle quickfix" })

-- ================================================================================
-- AUTO COMMANDS FOR KEYMAPS
-- ================================================================================

-- Set keymaps for specific filetypes
local augroup = vim.api.nvim_create_augroup("FileTypeKeymaps", { clear = true })

-- Python specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "python",
	callback = function()
		keymap("n", "<leader>rp", ":!python %<CR>", { desc = "Run Python file", buffer = true })
		keymap("n", "<leader>ri", ":!python -i %<CR>", { desc = "Run Python interactive", buffer = true })
	end,
})

-- JavaScript/TypeScript specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	callback = function()
		keymap("n", "<leader>rn", ":!node %<CR>", { desc = "Run Node.js file", buffer = true })
		keymap("n", "<leader>rN", ":!npm start<CR>", { desc = "npm start", buffer = true })
	end,
})

-- Rust specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "rust",
	callback = function()
		keymap("n", "<leader>rr", ":!cargo run<CR>", { desc = "Cargo run", buffer = true })
		keymap("n", "<leader>rt", ":!cargo test<CR>", { desc = "Cargo test", buffer = true })
		keymap("n", "<leader>rc", ":!cargo check<CR>", { desc = "Cargo check", buffer = true })
		keymap("n", "<leader>rb", ":!cargo build<CR>", { desc = "Cargo build", buffer = true })
	end,
})

-- Go specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "go",
	callback = function()
		keymap("n", "<leader>rg", ":!go run %<CR>", { desc = "Go run", buffer = true })
		keymap("n", "<leader>rt", ":!go test<CR>", { desc = "Go test", buffer = true })
		keymap("n", "<leader>rb", ":!go build<CR>", { desc = "Go build", buffer = true })
	end,
})

-- Lua specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "lua",
	callback = function()
		keymap("n", "<leader>rl", ":luafile %<CR>", { desc = "Source Lua file", buffer = true })
	end,
})

-- Markdown specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "markdown",
	callback = function()
		keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Markdown preview", buffer = true })
		keymap("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop markdown preview", buffer = true })
	end,
})

-- SQL specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "sql",
	callback = function()
		keymap("n", "<leader>se", "<Plug>(sqls-execute-query)", { desc = "Execute SQL query", buffer = true })
		keymap("v", "<leader>se", "<Plug>(sqls-execute-query)", { desc = "Execute SQL selection", buffer = true })
	end,
})

-- JSON specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "json",
	callback = function()
		keymap("n", "<leader>jf", ":%!jq .<CR>", { desc = "Format JSON", buffer = true })
		keymap("n", "<leader>jc", ":%!jq -c .<CR>", { desc = "Compact JSON", buffer = true })
	end,
})

-- YAML specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "yaml",
	callback = function()
		keymap("n", "<leader>yv", ":!yamllint %<CR>", { desc = "Validate YAML", buffer = true })
	end,
})

-- Docker specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "dockerfile",
	callback = function()
		keymap("n", "<leader>db", ":!docker build -t %:t:r .<CR>", { desc = "Docker build", buffer = true })
	end,
})

-- ================================================================================
-- TERMINAL KEYMAPS
-- ================================================================================

-- Terminal mode mappings
keymap("t", "<esc>", [[<C-\><C-n>]], opts)
keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

-- ================================================================================
-- COMMAND LINE MAPPINGS
-- ================================================================================

-- Command line history navigation
keymap("c", "<C-j>", "<Down>")
keymap("c", "<C-k>", "<Up>")

-- Better command line editing
keymap("c", "<C-h>", "<Left>")
keymap("c", "<C-l>", "<Right>")
keymap("c", "<C-a>", "<Home>")
keymap("c", "<C-e>", "<End>")
keymap("c", "<C-d>", "<Del>")

-- ================================================================================
-- ADDITIONAL UTILITY KEYMAPS
-- ================================================================================

-- Close all buffers except current
keymap("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close other buffers" })

-- Close current buffer
keymap("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })

-- Force close current buffer
keymap("n", "<leader>bD", ":bd!<CR>", { desc = "Force close buffer" })

-- Switch to last buffer
keymap("n", "<leader>bl", "<C-^>", { desc = "Last buffer" })

-- New buffer
keymap("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })

-- Copy entire buffer to clipboard
keymap("n", "<leader>by", ":%y+<CR>", { desc = "Copy buffer" })

-- Paste from clipboard
keymap("n", "<leader>bp", '"+p', { desc = "Paste from clipboard" })

-- Select all
keymap("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Increment/decrement numbers
keymap("n", "+", "<C-a>", { desc = "Increment number" })
keymap("n", "-", "<C-x>", { desc = "Decrement number" })

-- Join lines without space
keymap("n", "<leader>J", "gJ", { desc = "Join lines without space" })

-- Duplicate line
keymap("n", "<leader>yl", "yyp", { desc = "Duplicate line" })

-- Delete line without yanking
keymap("n", "<leader>dl", '"_dd', { desc = "Delete line (no yank)" })

-- Change word without yanking
keymap("n", "<leader>cw", '"_ciw', { desc = "Change word (no yank)" })

-- ================================================================================
-- MACROS AND REGISTERS
-- ================================================================================

-- Quick macro recording and playback
keymap("n", "Q", "@q", { desc = "Play macro q" })
keymap("v", "Q", ":norm @q<CR>", { desc = "Play macro q on selection" })

-- Clear registers
keymap("n", "<leader>rc", function()
	vim.cmd("let @+ = ''")
	vim.cmd("let @* = ''")
	vim.cmd("let @\" = ''")
	print("Registers cleared!")
end, { desc = "Clear registers" })

-- ================================================================================
-- SPLIT AND WINDOW MANAGEMENT
-- ================================================================================

-- Equal window sizes
keymap("n", "<leader>=", "<C-w>=", { desc = "Equal windows" })

-- Max out height/width of current window
keymap("n", "<leader>_", "<C-w>_", { desc = "Max height" })
keymap("n", "<leader>+", "<C-w>|", { desc = "Max width" })

-- Move between splits
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to bottom split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to top split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- ================================================================================
-- SEARCH AND NAVIGATION
-- ================================================================================

-- Better search
keymap("n", "n", "nzzzv", { desc = "Next search result" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Search and replace word under cursor
keymap(
	"n",
	"<leader>sw",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor" }
)

-- Search visual selection
keymap("v", "//", 'y/\\V<C-R>=escape(@","/\\\\")<CR><CR>', { desc = "Search selection" })

-- ================================================================================
-- NEOVIM SPECIFIC UTILITIES
-- ================================================================================

-- Show syntax group under cursor
keymap("n", "<F10>", function()
	local result = vim.treesitter.get_captures_at_cursor(0)
	print(vim.inspect(result))
end, { desc = "Show treesitter capture" })

-- Inspect highlight group under cursor
keymap("n", "<F11>", function()
	local result = vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1)
	local name = vim.fn.synIDattr(result, "name")
	print("Highlight group: " .. name)
end, { desc = "Show highlight group" })

-- Toggle spell checking
keymap("n", "<F7>", function()
	vim.wo.spell = not vim.wo.spell
	print("Spell check: " .. (vim.wo.spell and "enabled" or "disabled"))
end, { desc = "Toggle spell check" })

-- ================================================================================
-- PLUGIN SPECIFIC KEYMAPS HELPERS
-- ================================================================================

-- Helper function to check if plugin is loaded
local function plugin_loaded(plugin_name)
	return package.loaded[plugin_name] ~= nil
end

-- Conditional keymaps that only work if plugins are loaded
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Additional telescope keymaps if loaded
		if plugin_loaded("telescope") then
			keymap("n", "<leader>ft", "<cmd>Telescope<cr>", { desc = "Telescope" })
		end

		-- Additional nvim-tree keymaps if loaded
		if plugin_loaded("nvim-tree") then
			keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
		end

		-- Additional DAP keymaps if loaded
		if plugin_loaded("dap") then
			keymap("n", "<F5>", function()
				require("dap").continue()
			end, { desc = "Continue" })
			keymap("n", "<F10>", function()
				require("dap").step_over()
			end, { desc = "Step Over" })
			keymap("n", "<F11>", function()
				require("dap").step_into()
			end, { desc = "Step Into" })
			keymap("n", "<F12>", function()
				require("dap").step_out()
			end, { desc = "Step Out" })
		end
	end,
})

-- ================================================================================
-- LEADER KEY DESCRIPTIONS
-- ================================================================================

-- Set up which-key descriptions for leader groups
local wk = require("which-key")
wk.register({
	["<leader>"] = {
		b = { name = "+buffer" },
		c = { name = "+code" },
		d = { name = "+debug" },
		f = { name = "+file/find" },
		g = { name = "+git" },
		h = { name = "+harpoon" },
		l = { name = "+lazy" },
		m = { name = "+minimap" },
		q = { name = "+quit/session" },
		r = { name = "+run" },
		s = { name = "+search" },
		t = { name = "+terminal" },
		T = { name = "+test" },
		u = { name = "+ui" },
		w = { name = "+windows" },
		x = { name = "+trouble" },
		y = { name = "+yank" },
		D = { name = "+data-engineering" },
		C = { name = "+coverage" },
	},
})

-- ================================================================================
-- PERFORMANCE OPTIMIZATIONS
-- ================================================================================

-- Disable some default vim mappings for better performance
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")

-- Set timeout for key sequences
vim.opt.timeout = true
vim.opt.timeoutlen = 300
