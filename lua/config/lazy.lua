--
vim.g.mapleader = " "
vim.g.maplocalleader = ","
--
-- Clone and install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- If no folder
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	-- Clone
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	-- If error cloned
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

-- Add lazy.nvim folder to runtime
vim.opt.rtp:prepend(lazypath)

require("config.vim-opts")

-- Setup lazy.nvim with new plugin structure
require("lazy").setup({
	spec = {
		-- Import the new centralized plugins list
		{ import = "plugins.plugins_list" },
	},

	-- Colorscheme that will be used when installing plugins
	install = { colorscheme = { "tokyonight" } },

	-- Automatically check for plugin updates
	checker = { enabled = true, notify = false },

	-- Performance optimizations for 0.12
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- Load hotkeys
require("config.hotkeys")

-- Load yql syntax highlighting
require("config.scripts.yql-syntax-highliting.config").setup()
