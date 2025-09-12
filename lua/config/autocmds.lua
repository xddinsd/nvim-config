-- ================================================================================
-- NEOVIM DATA ENGINEERING IDE - AUTOCOMMANDS
-- ================================================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- ================================================================================
-- GENERAL AUTOCOMMANDS
-- ================================================================================

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("HighlightYank", {}),
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})

-- Resize splits if window got resized
autocmd({ "VimResized" }, {
	group = augroup("ResizeSplits", {}),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
	group = augroup("LastLocation", {}),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_location then
			return
		end
		vim.b[buf].last_location = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Close some filetypes with <q>
autocmd("FileType", {
	group = augroup("CloseWithQ", {}),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Wrap and check for spell in text filetypes
autocmd("FileType", {
	group = augroup("WrapSpell", {}),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Fix conceallevel for json files
autocmd({ "FileType" }, {
	group = augroup("JsonConceal", {}),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
	group = augroup("AutoCreateDir", {}),
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- ================================================================================
-- FILETYPE SPECIFIC AUTOCOMMANDS
-- ================================================================================

-- Python specific settings
autocmd("FileType", {
	group = augroup("PythonSettings", {}),
	pattern = "python",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
		vim.opt_local.autoindent = true
		vim.opt_local.fileformat = "unix"

		-- Python-specific keymaps
		vim.keymap.set("n", "<leader>rp", ":!python %<CR>", { buffer = true, desc = "Run Python file" })
		vim.keymap.set("n", "<leader>ri", ":!python -i %<CR>", { buffer = true, desc = "Run Python interactive" })
		vim.keymap.set("n", "<leader>rt", ":!python -m pytest %<CR>", { buffer = true, desc = "Run pytest" })
		vim.keymap.set("n", "<leader>rd", ":!python -m pdb %<CR>", { buffer = true, desc = "Debug with pdb" })
	end,
})

-- JavaScript/TypeScript settings
autocmd("FileType", {
	group = augroup("JSSettings", {}),
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true

		-- JS/TS specific keymaps
		vim.keymap.set("n", "<leader>rn", ":!node %<CR>", { buffer = true, desc = "Run with Node.js" })
		vim.keymap.set("n", "<leader>rt", ":!npm test<CR>", { buffer = true, desc = "Run npm test" })
		vim.keymap.set("n", "<leader>rb", ":!npm run build<CR>", { buffer = true, desc = "Run npm build" })
	end,
})

-- Lua settings
autocmd("FileType", {
	group = augroup("LuaSettings", {}),
	pattern = "lua",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true

		-- Lua specific keymaps
		vim.keymap.set("n", "<leader>rl", ":luafile %<CR>", { buffer = true, desc = "Source Lua file" })
	end,
})

-- Go settings
autocmd("FileType", {
	group = augroup("GoSettings", {}),
	pattern = "go",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = false -- Go uses tabs

		-- Go specific keymaps
		vim.keymap.set("n", "<leader>rg", ":!go run %<CR>", { buffer = true, desc = "Go run" })
		vim.keymap.set("n", "<leader>rt", ":!go test<CR>", { buffer = true, desc = "Go test" })
		vim.keymap.set("n", "<leader>rb", ":!go build<CR>", { buffer = true, desc = "Go build" })
		vim.keymap.set("n", "<leader>rf", ":!gofmt -w %<CR>", { buffer = true, desc = "Format Go file" })
	end,
})

-- Rust settings
autocmd("FileType", {
	group = augroup("RustSettings", {}),
	pattern = "rust",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true

		-- Rust specific keymaps
		vim.keymap.set("n", "<leader>rr", ":!cargo run<CR>", { buffer = true, desc = "Cargo run" })
		vim.keymap.set("n", "<leader>rt", ":!cargo test<CR>", { buffer = true, desc = "Cargo test" })
		vim.keymap.set("n", "<leader>rb", ":!cargo build<CR>", { buffer = true, desc = "Cargo build" })
		vim.keymap.set("n", "<leader>rc", ":!cargo check<CR>", { buffer = true, desc = "Cargo check" })
	end,
})

-- SQL settings
autocmd("FileType", {
	group = augroup("SqlSettings", {}),
	pattern = "sql",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
		vim.opt_local.commentstring = "-- %s"
	end,
})

-- YAML settings
autocmd("FileType", {
	group = augroup("YamlSettings", {}),

	pattern = { "yaml", "yml" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
		vim.opt_local.foldmethod = "indent"

		-- YAML specific keymaps
		vim.keymap.set("n", "<leader>yv", ":!yamllint %<CR>", { buffer = true, desc = "Validate YAML" })
	end,
})

-- JSON settings
autocmd("FileType", {
	group = augroup("JsonSettings", {}),
	pattern = { "json", "jsonc" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
		vim.opt_local.conceallevel = 0

		-- JSON specific keymaps
		vim.keymap.set("n", "<leader>jf", ":%!jq .<CR>", { buffer = true, desc = "Format JSON" })
		vim.keymap.set("n", "<leader>jc", ":%!jq -c .<CR>", { buffer = true, desc = "Compact JSON" })
	end,
})

-- Markdown settings
autocmd("FileType", {
	group = augroup("MarkdownSettings", {}),
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.breakindent = true
		vim.opt_local.spell = true
		vim.opt_local.conceallevel = 0

		-- Markdown specific keymaps
		vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { buffer = true, desc = "Markdown preview" })
		vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { buffer = true, desc = "Stop markdown preview" })
	end,
})

-- Docker settings
autocmd("FileType", {
	group = augroup("DockerSettings", {}),
	pattern = "dockerfile",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true

		-- Docker specific keymaps
		vim.keymap.set("n", "<leader>db", ":!docker build -t %:t:r .<CR>", { buffer = true, desc = "Docker build" })
	end,
})

-- ================================================================================
-- LSP SPECIFIC AUTOCOMMANDS
-- ================================================================================

-- LSP attach autocommands
autocmd("LspAttach", {
	group = augroup("LspAttach", {}),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Jump to the definition of the word under your cursor
		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end

		-- Enable inlay hints if supported
		if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
			vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
		end
	end,
})

-- ================================================================================
-- TERMINAL AUTOCOMMANDS
-- ================================================================================

-- Terminal settings
autocmd("TermOpen", {
	group = augroup("TerminalSettings", {}),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.cmd("startinsert!")
	end,
})

-- Auto insert mode for terminal
autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
	group = augroup("TerminalAutoInsert", {}),
	callback = function(args)
		if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
			vim.cmd("startinsert!")
		end
	end,
})

-- ================================================================================
-- WINDOW AND BUFFER MANAGEMENT
-- ================================================================================

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("Checktime", {}),
	command = "checktime",
})

-- Auto-delete hidden buffers
autocmd("BufHidden", {
	group = augroup("DeleteHiddenBuffers", {}),
	callback = function(event)
		if vim.bo[event.buf].buftype == "" and not vim.bo[event.buf].modified then
			vim.schedule(function()
				pcall(vim.api.nvim_buf_delete, event.buf, {})
			end)
		end
	end,
})

-- ================================================================================
-- FORMATTING AUTOCOMMANDS
-- ================================================================================

-- Format on save (if conform is available and enabled)
autocmd("BufWritePre", {
	group = augroup("FormatOnSave", {}),
	callback = function()
		if vim.g.autoformat == nil then
			vim.g.autoformat = true
		end

		if vim.g.autoformat then
			local conform = package.loaded["conform"]
			if conform then
				conform.format({ lsp_fallback = true, timeout_ms = 500 })
			end
		end
	end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
	group = augroup("TrimWhitespace", {}),
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

-- ================================================================================
-- GIT INTEGRATION AUTOCOMMANDS
-- ================================================================================

-- Git commit settings
autocmd("FileType", {
	group = augroup("GitCommit", {}),
	pattern = "gitcommit",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt_local.textwidth = 72
		vim.opt_local.colorcolumn = "50,72"
	end,
})

-- ================================================================================
-- DATA ENGINEERING SPECIFIC AUTOCOMMANDS
-- ================================================================================

-- Jupyter notebook settings
autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("JupyterSettings", {}),
	pattern = "*.ipynb",
	callback = function()
		vim.opt_local.filetype = "json"
		vim.opt_local.conceallevel = 0

		-- Add Jupyter specific keymaps
		vim.keymap.set(
			"n",
			"<leader>jr",
			":!jupyter nbconvert --execute --inplace %<CR>",
			{ buffer = true, desc = "Run notebook" }
		)
		vim.keymap.set(
			"n",
			"<leader>jc",
			":!jupyter nbconvert --clear-output %<CR>",
			{ buffer = true, desc = "Clear output" }
		)
	end,
})

-- CSV file settings
autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("CsvSettings", {}),
	pattern = "*.csv",
	callback = function()
		vim.opt_local.wrap = false
		vim.opt_local.scrollbind = true

		-- CSV specific keymaps
		vim.keymap.set("n", "<leader>cv", ":!csvlook %<CR>", { buffer = true, desc = "View CSV" })
		vim.keymap.set("n", "<leader>cs", ":!csvstat %<CR>", { buffer = true, desc = "CSV stats" })
	end,
})

-- Parquet file settings
autocmd({
	"BufRead",
	"BufNewFile",
}, {
	group = augroup("ParquetSettings", {}),
	pattern = "*.parquet",
	callback = function()
		vim.keymap.set("n", "<leader>pv", ":!parquet-tools show %<CR>", { buffer = true, desc = "View Parquet" })
		vim.keymap.set("n", "<leader>ps", ":!parquet-tools schema %<CR>", { buffer = true, desc = "Parquet schema" })
		vim.keymap.set("n", "<leader>pm", ":!parquet-tools meta %<CR>", { buffer = true, desc = "Parquet metadata" })
	end,
})

-- Configuration files (TOML, INI, CONF)
autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("ConfigFiles", {}),
	pattern = { "*.toml", "*.ini", "*.conf", "*.cfg", "requirements.txt", "Pipfile" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
	end,
})

-- Apache Airflow DAG files
autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("AirflowSettings", {}),
	pattern = { "*_dag.py", "dags/*.py" },
	callback = function()
		vim.keymap.set("n", "<leader>at", ":!airflow dags test<CR>", { buffer = true, desc = "Test Airflow DAG" })
		vim.keymap.set("n", "<leader>al", ":!airflow dags list<CR>", { buffer = true, desc = "List Airflow DAGs" })
	end,
})

-- DBT files
autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("DbtSettings", {}),
	pattern = { "*.sql" },
	callback = function()
		local file_path = vim.fn.expand("%:p")
		if string.match(file_path, "models/") or string.match(file_path, "dbt") then
			vim.keymap.set("n", "<leader>dr", ":!dbt run<CR>", { buffer = true, desc = "DBT run" })
			vim.keymap.set("n", "<leader>dt", ":!dbt test<CR>", { buffer = true, desc = "DBT test" })
			vim.keymap.set("n", "<leader>dc", ":!dbt compile<CR>", { buffer = true, desc = "DBT compile" })
			vim.keymap.set("n", "<leader>dd", ":!dbt debug<CR>", { buffer = true, desc = "DBT debug" })
		end
	end,
})

-- Terraform files
autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("TerraformSettings", {}),
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true

		-- Terraform specific keymaps
		vim.keymap.set("n", "<leader>ti", ":!terraform init<CR>", { buffer = true, desc = "Terraform init" })
		vim.keymap.set("n", "<leader>tp", ":!terraform plan<CR>", { buffer = true, desc = "Terraform plan" })
		vim.keymap.set("n", "<leader>ta", ":!terraform apply<CR>", { buffer = true, desc = "Terraform apply" })
		vim.keymap.set("n", "<leader>tf", ":!terraform fmt<CR>", { buffer = true, desc = "Terraform format" })
		vim.keymap.set("n", "<leader>tv", ":!terraform validate<CR>", { buffer = true, desc = "Terraform validate" })
	end,
})

-- ================================================================================
-- PERFORMANCE OPTIMIZATIONS
-- ================================================================================

-- Disable some features for large files
autocmd({ "BufReadPre" }, {
	group = augroup("LargeFileHandling", {}),
	callback = function()
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))

		if ok and stats and stats.size > max_filesize then
			vim.opt_local.foldmethod = "manual"
			vim.opt_local.spell = false
			vim.opt_local.swapfile = false
			vim.opt_local.undofile = false
			vim.opt_local.breakindent = false
			vim.opt_local.colorcolumn = ""
			vim.opt_local.statuscolumn = ""
			vim.opt_local.signcolumn = "no"
			vim.opt_local.foldcolumn = "0"
			vim.opt_local.winbar = ""
			vim.b.minianimate_disable = true
			vim.b.miniindentscope_disable = true
			vim.schedule(function()
				vim.bo.syntax = ""
			end)
		end
	end,
})

-- ================================================================================
-- COMPLETION AND SNIPPETS
-- ================================================================================

-- Set up completion for different filetypes
autocmd("FileType", {
	group = augroup("CompletionSettings", {}),
	pattern = { "sql", "mysql", "plsql" },
	callback = function()
		require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
	end,
})

-- ================================================================================
-- PROJECT DETECTION
-- ================================================================================

-- Automatically detect project type and set appropriate settings
autocmd({ "VimEnter", "BufEnter" }, {
	group = augroup("ProjectDetection", {}),
	callback = function()
		local cwd = vim.fn.getcwd()
		local project_files = {
			["requirements.txt"] = "python",
			["pyproject.toml"] = "python",
			["setup.py"] = "python",
			["Pipfile"] = "python",
			["package.json"] = "javascript",
			["yarn.lock"] = "javascript",
			["Cargo.toml"] = "rust",
			["go.mod"] = "go",
			["pom.xml"] = "java",
			["build.gradle"] = "java",
			["Dockerfile"] = "docker",
			["docker-compose.yml"] = "docker",
			["docker-compose.yaml"] = "docker",
			[".terraform"] = "terraform",
			["dbt_project.yml"] = "dbt",
			["airflow.cfg"] = "airflow",
		}

		for file, project_type in pairs(project_files) do
			if vim.fn.filereadable(cwd .. "/" .. file) == 1 or vim.fn.isdirectory(cwd .. "/" .. file) == 1 then
				vim.g.project_type = project_type
				break
			end
		end
	end,
})

-- ================================================================================
-- DEBUGGING AUTOCOMMANDS
-- ================================================================================

-- DAP UI auto open/close
autocmd({ "BufWinEnter", "BufWinLeave" }, {
	group = augroup("DapUI", {}),
	callback = function(args)
		if package.loaded.dap and package.loaded.dapui then
			local filetype = vim.bo[args.buf].filetype
			if
				filetype == "dapui_console"
				or filetype == "dapui_watches"
				or filetype == "dapui_stacks"
				or filetype == "dapui_breakpoints"
				or filetype == "dapui_scopes"
			then
				vim.schedule(function()
					require("dapui").open()
				end)
			end
		end
	end,
})

-- ================================================================================
-- STATUSLINE UPDATES
-- ================================================================================

-- Update statusline based on file changes
autocmd({ "BufEnter", "BufWritePost", "TextChanged", "TextChangedI" }, {
	group = augroup("StatuslineUpdate", {}),
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

-- ================================================================================
-- BACKUP AND UNDO MANAGEMENT
-- ================================================================================

-- Clean old backup files
autocmd("VimEnter", {
	group = augroup("CleanBackups", {}),
	callback = function()
		local backup_dir = vim.fn.stdpath("data") .. "/backup"
		if vim.fn.isdirectory(backup_dir) == 1 then
			-- Remove backup files older than 30 days
			vim.fn.system("find " .. backup_dir .. " -type f -mtime +30 -delete 2>/dev/null")
		end
	end,
})

-- ================================================================================
-- PLUGIN SPECIFIC AUTOCOMMANDS
-- ================================================================================

-- Telescope custom settings
autocmd("FileType", {
	group = augroup("TelescopeSettings", {}),
	pattern = "TelescopePrompt",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.wrap = false
	end,
})

-- NvimTree custom settings
autocmd("FileType", {
	group = augroup("NvimTreeSettings", {}),
	pattern = "NvimTree",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

-- Trouble custom settings
autocmd("FileType", {
	group = augroup("TroubleSettings", {}),
	pattern = "trouble",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

-- ================================================================================
-- SESSION MANAGEMENT
-- ================================================================================

-- Auto-save session on exit
autocmd("VimLeavePre", {
	group = augroup("AutoSession", {}),
	callback = function()
		if package.loaded.persistence and vim.fn.argc() == 0 then
			require("persistence").save()
		end
	end,
})

-- ================================================================================
-- COLORSCHEME PERSISTENCE
-- ================================================================================

-- Save colorscheme choice
autocmd("ColorScheme", {
	group = augroup("ColorSchemePersist", {}),
	callback = function()
		vim.schedule(function()
			local colorscheme_file = vim.fn.stdpath("data") .. "/last_colorscheme"
			local file = io.open(colorscheme_file, "w")
			if file then
				file:write(vim.g.colors_name or "default")
				file:close()
			end
		end)
	end,
})

-- Load last colorscheme on startup
autocmd("VimEnter", {
	group = augroup("ColorSchemeLoad", {}),
	once = true,
	callback = function()
		local colorscheme_file = vim.fn.stdpath("data") .. "/last_colorscheme"
		local file = io.open(colorscheme_file, "r")
		if file then
			local colorscheme = file:read("*all"):gsub("\n", "")
			file:close()
			if colorscheme and colorscheme ~= "" then
				pcall(vim.cmd.colorscheme, colorscheme)
			end
		end
	end,
})

-- ================================================================================
-- HEALTH CHECKS
-- ================================================================================

-- Check for external dependencies
autocmd("VimEnter", {
	group = augroup("HealthCheck", {}),
	once = true,
	callback = function()
		vim.schedule(function()
			local health_checks = {
				{ cmd = "git", name = "Git" },
				{ cmd = "python3", name = "Python 3" },
				{ cmd = "node", name = "Node.js" },
				{ cmd = "rg", name = "Ripgrep" },
				{ cmd = "fd", name = "fd" },
				{ cmd = "fzf", name = "fzf" },
			}

			local missing = {}
			for _, check in ipairs(health_checks) do
				if vim.fn.executable(check.cmd) == 0 then
					table.insert(missing, check.name)
				end
			end

			if #missing > 0 then
				vim.notify(
					"Missing dependencies: " .. table.concat(missing, ", ") .. "\nSome features may not work properly.",
					vim.log.levels.WARN,
					{ title = "Health Check" }
				)
			end
		end)
	end,
})

-- ================================================================================
-- WORKSPACE MANAGEMENT
-- ================================================================================

-- Set working directory to project root
autocmd("BufEnter", {
	group = augroup("AutoCwd", {}),
	callback = function()
		local root_patterns = { ".git", "pyproject.toml", "package.json", "Cargo.toml", "go.mod", "dbt_project.yml" }
		local root = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])

		if root and root ~= vim.fn.getcwd() then
			vim.api.nvim_set_current_dir(root)
		end
	end,
})

-- ================================================================================
-- ERROR HANDLING
-- ================================================================================

-- Handle plugin loading errors gracefully
autocmd("VimEnter", {
	group = augroup("PluginErrorHandling", {}),
	once = true,
	callback = function()
		vim.schedule(function()
			-- Check for common plugin loading issues
			local plugins_to_check = { "telescope", "nvim-tree", "lualine" }
			for _, plugin in ipairs(plugins_to_check) do
				if not package.loaded[plugin] then
					vim.notify(
						"Plugin '" .. plugin .. "' failed to load. Check your configuration.",
						vim.log.levels.WARN,
						{ title = "Plugin Error" }
					)
				end
			end
		end)
	end,
})

-- ================================================================================
-- PRODUCTIVITY ENHANCEMENTS
-- ================================================================================

-- Auto-save on focus lost
autocmd({ "FocusLost", "BufLeave" }, {
	group = augroup("AutoSave", {}),
	callback = function()
		if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
			vim.cmd("silent! write")
		end
	end,
})

-- Show cursor line only in active window
autocmd({ "WinEnter", "FocusGained" }, {
	group = augroup("CursorLineControl", {}),
	callback = function()
		if vim.bo.buftype == "" then
			vim.opt_local.cursorline = true
		end
	end,
})

autocmd({ "WinLeave", "FocusLost" }, {
	group = augroup("CursorLineControl", {}),
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

-- ================================================================================
-- FINAL SETUP
-- ================================================================================

-- Ensure all autocommands are properly set up
autocmd("VimEnter", {
	group = augroup("FinalSetup", {}),
	once = true,
	callback = function()
		-- Any final setup tasks
		vim.schedule(function()
			vim.notify("Neovim Data Engineering IDE loaded successfully!", vim.log.levels.INFO, { title = "IDE Ready" })
		end)
	end,
})
