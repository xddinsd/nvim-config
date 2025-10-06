local configs = require("plugins.plugins_configs")

return {
	-- ================================================================================
	-- MODERN COMPLETION & SNIPPETS
	-- ================================================================================
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = "rafamadriz/friendly-snippets",
		version = "v0.*",
		config = configs["blink.cmp"],
	},

	-- ================================================================================
	-- NOICE & MODERN UI
	-- ================================================================================
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = configs["noice.nvim"],
	},

	{
		"rcarriga/nvim-notify",
		config = configs["nvim-notify"],
	},

	-- ================================================================================
	-- THEME SELECTOR & THEMES
	-- ================================================================================
	{
		"zaldih/themery.nvim",
		config = configs["themery.nvim"],
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = configs["tokyonight.nvim"],
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = configs["catppuccin"],
	},

	{
		"rebelot/kanagawa.nvim",
		config = configs["kanagawa.nvim"],
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = configs["rose-pine"],
	},

	{
		"EdenEast/nightfox.nvim",
		config = configs["nightfox.nvim"],
	},

	{
		"Mofiqul/dracula.nvim",
		config = configs["dracula.nvim"],
	},

	-- ================================================================================
	-- GIT & GITLAB INTEGRATION
	-- ================================================================================
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = configs["neogit"],
	},

	{
		"harrisoncramer/gitlab.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"stevearc/dressing.nvim",
		},
		build = function()
			require("gitlab.server").build()
		end,
		config = configs["gitlab.nvim"],
	},

	{
		"sindrets/diffview.nvim",
		config = configs["diffview.nvim"],
	},

	{
		"f-person/git-blame.nvim",
		config = configs["git-blame.nvim"],
	},

	-- ================================================================================
	-- JUPYTER NOTEBOOK
	-- ================================================================================
    {
        "benlubas/molten-nvim",
        dependencies = { "image.nvim" },
        ft = { "python", "norg", "markdown", "quarto" }, -- this is just to avoid loading image.nvim, loading molten at the start has minimal startup time impact
        init = configs["molten-nvim-init"],
    },
    {
        "3rd/image.nvim",
        dependencies = { "https://github.com/leafo/magick" },
        ft = { "markdown", "norg" },
        config = configs["image.nvim"]
    },
    {
        "GCBallesteros/jupytext.nvim",
        -- ft = { "ipynb" },
        opts = configs["jupytext.nvim"]
    },
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "nvim-lspconfig",
            "nvimtools/hydra.nvim",
            "otter.nvim",
        },
        ft = { "quarto", "markdown", "norg" },
        config = configs["quarto-nvim"],
    },
    { "jmbuhr/otter.nvim", ft = { "markdown", "quarto", "norg" }},

	-- ================================================================================
	-- DATA ENGINEERING & DEVOPS
	-- ================================================================================

    {
		"mgierada/lazydocker.nvim",
		dependencies = { "akinsho/toggleterm.nvim" },
		config = configs["lazydocker.nvim"],
	},

	{
		"Ramilito/kubectl.nvim",
		dependencies = { "saghen/blink.download" },
		config = configs["kubectl.nvim"],
	},

	{
		"someone-stole-my-name/yaml-companion.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = configs["yaml-companion.nvim"],
	},

	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		config = configs["vim-dadbod-ui"],
	},

	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = configs["rest.nvim"],
	},

	-- S3 integration
	{
		"kiran94/s3edit.nvim",
		config = configs["s3edit.nvim"],
	},

	-- ================================================================================
	-- SCALA & METALS
	-- ================================================================================
	{
		"scalameta/nvim-metals",
		ft = { "scala", "sbt" },
		dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
		config = configs["nvim-metals"],
	},

	-- ================================================================================
	-- ENHANCED CODE EDITING
	-- ================================================================================
	{
		"aznhe21/actions-preview.nvim",
		config = configs["actions-preview.nvim"],
	},

	{
		"smjonas/inc-rename.nvim",
		config = configs["inc-rename.nvim"],
	},

	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		config = configs["outline.nvim"],
	},

	{
		"mg979/vim-visual-multi",
		config = configs["vim-visual-multi"],
	},

	{
		"echasnovski/mini.ai",
		version = false,
		config = configs["mini.ai"],
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = configs["nvim-surround"],
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = configs["nvim-autopairs"],
	},

	-- Better commenting
	{
		"numToStr/Comment.nvim",
		config = configs["Comment.nvim"],
	},

	-- ================================================================================
	-- PROJECT & SESSION MANAGEMENT
	-- ================================================================================
	{
		"ahmedkhalf/project.nvim",
		config = configs["project.nvim"],
	},

	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = configs["persistence.nvim"],
	},

	-- ================================================================================
	-- DIAGNOSTICS & TROUBLE
	-- ================================================================================
	{
		"folke/trouble.nvim",
		dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
		config = configs["trouble.nvim"],
	},

	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = configs["nvim-bqf"],
	},

	-- ================================================================================
	-- TESTING & DEBUGGING
	-- ================================================================================
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- Test adapters
			"nvim-neotest/neotest-python",
			"mfussenegger/nvim-jdtls",
			"theHamsta/nvim-dap-virtual-text",
			"rcasia/neotest-java",
		},

		config = configs["neotest"],
	},

	{
		"andythigpen/nvim-coverage",
		config = configs["nvim-coverage"],
	},

	{
		"mfussenegger/nvim-dap",
		config = configs["nvim-dap"],
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = configs["nvim-dap-ui"],
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		config = configs["nvim-dap-python"],
	},

	-- ================================================================================
	-- UI ENHANCEMENTS
	-- ================================================================================
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = configs["lualine.nvim"],
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = configs["indent-blankline.nvim"],
	},

	{
		"stevearc/dressing.nvim",
		config = configs["dressing.nvim"],
	},

	{
		"goolord/alpha-nvim",
		config = configs["alpha-nvim"],
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = configs["nvim-ufo"],
	},

	{
		"karb94/neoscroll.nvim",
		config = configs["neoscroll.nvim"],
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = configs["nvim-colorizer.lua"],
	},

	{
		"b0o/incline.nvim",
		config = configs["incline.nvim"],
	},

	{
		"gorbit99/codewindow.nvim",
		config = configs["codewindow.nvim"],
	},

	-- ================================================================================
	-- NAVIGATION & SEARCH
	-- ================================================================================
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		config = configs["flash.nvim"],
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = configs["harpoon"],
	},

	{
		"MagicDuck/grug-far.nvim",
		config = configs["grug-far.nvim"],
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = configs["telescope.nvim"],
	},

	{
		"dawsers/telescope-file-history.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = configs["telescope-file-history.nvim"],
	},

	-- ================================================================================
	-- FILE EXPLORER
	-- ================================================================================
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
		config = configs["nvim-tree.lua"],
	},

	-- ================================================================================
	-- TERMINAL & EXTERNAL TOOLS
	-- ================================================================================
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = configs["toggleterm.nvim"],
	},

	-- ================================================================================
	-- FORMATTING & CODE QUALITY
	-- ================================================================================
	{
		"stevearc/conform.nvim",
		config = configs["conform.nvim"],
	},

	-- ================================================================================
	-- SYNTAX HIGHLIGHTING & PARSING
	-- ================================================================================
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = configs["nvim-treesitter"],
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = configs["nvim-treesitter-textobjects"],
	},

	-- ================================================================================
	-- KEYBOARD & HOTKEYS
	-- ================================================================================
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
		config = configs["which-key.nvim"],
	},

	-- ================================================================================
	-- GIT SIGNS
	-- ================================================================================
	{
		"lewis6991/gitsigns.nvim",
		config = configs["gitsigns.nvim"],
	},

	-- ================================================================================
	-- BROWSER INTEGRATION
	-- ================================================================================
	{
		"glacambre/firenvim",
		build = ":call firenvim#install(0)",
		config = configs["firenvim"],
	},

	-- ================================================================================
	-- ADDITIONAL UTILITIES
	-- ================================================================================
	{
		"b0o/schemastore.nvim",
		config = configs["schemastore.nvim"],
	},

	{
		"j-hui/fidget.nvim",
		config = configs["fidget.nvim"],
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_browser = "firefox"
		end,
		ft = { "markdown" },
		config = configs["markdown-preview.nvim"],
	},

	-- CSV support
	{
		"mechatroner/rainbow_csv",
		ft = "csv",
		config = configs["rainbow_csv"],
	},

	-- JSON tools
	{
		"gennaro-tedesco/nvim-jqx",
		ft = { "json", "yaml" },
		config = configs["nvim-jqx"],
	},
}
