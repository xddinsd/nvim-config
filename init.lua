-- init.lua
require("config.lazy")

-- Enable LSP servers using new 0.11+ API
vim.lsp.enable({
	-- Shell & Config
	"fish_lsp",
	"lua_ls",
	"bashls",
	"nil_ls",
	"hyprls",
	"vimls",
	"cmake",

	-- Web & Markup
	"html",
	"jsonls",
	"ltex",

	-- Languages
	"pyright",
	"ruff",
	"rust_analyzer",
	"kotlin_language_server",

	-- Data Engineering & DevOps
	"terraformls",
	"yamlls",
	"dockerls",
	"helm_ls",
	"sqlls",

	-- Note: metals (Scala) will be handled separately due to special setup requirements
})
