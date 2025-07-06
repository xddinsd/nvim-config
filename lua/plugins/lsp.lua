-- Adds language go to definition, linter, launguage docs in-place
-- Autocomplete and debugger
return {
	-- LSP servers
	{
		"neovim/nvim-lspconfig",
		build = ":TSUpdate",
		config = function()
			local nvim_lsp = require("lspconfig")
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local window_transparency = 20

			-- Window settings, same as in nvim-cmp
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
				winblend = window_transparency,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "single",
				winblend = window_transparency,
			})

			-- LSPs
			-- Shell
			nvim_lsp.fish_lsp.setup({ capabilities = capabilities })
			-- Config langs
			nvim_lsp.luau_lsp.setup({ capabilities = capabilities }) -- Lua
			nvim_lsp.hyprls.setup({ capabilities = capabilities })
			nvim_lsp.vimls.setup({ capabilities = capabilities })
			nvim_lsp.cmake.setup({ capabilities = capabilities })
			nvim_lsp.nil_ls.setup({ capabilities = capabilities }) -- Nix lang
			nvim_lsp.somesass_ls.setup({ capabilities = capabilities }) -- CSS SCSS SASS
			nvim_lsp.terraform_lsp.setup({ capabilities = capabilities })
			-- Info langs
			nvim_lsp.html.setup({ capabilities = capabilities })
			nvim_lsp.ltex_plus.setup({ capabilities = capabilities }) -- latex and markdown
			nvim_lsp.jsonls.setup({ capabilities = capabilities })
			-- Main
			-- nvim_lsp.metals         .setup{capabilities = capabilities} -- Scala fast LSP with no debug support (requires self-installed metals) (to toggle uncomment and delete nvim-metals below)

			-- nvim_lsp.sqlls          .setup{capabilities = capabilities} -- Turn off to deal with YQL
			nvim_lsp.ruff.setup({ capabilities = capabilities })
			-- nvim_lsp.pylyzer        .setup{capabilities = capabilities} -- Python

			nvim_lsp.rust_analyzer.setup({ capabilities = capabilities })
			nvim_lsp.kotlin_language_server.setup({ capabilities = capabilities })
		end,
	},

	-- Dedicated scala LSP to provide debugger
	{
		"scalameta/nvim-metals",
		ft = { "scala", "sbt" },
		dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },

		-- Metals settings
		opts = function()
			local metals_config = require("metals").bare_config()

			metals_config.settings = {
				showImplicitArguments = true,
			}

			metals_config.init_options.statusBarProvider = "off" -- Turn on if no fidget.nvim

			metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

			metals_config.on_attach = function(client, bufnr)
				require("metals").setup_dap()
			end
			return metals_config
		end,

		-- Add autocmd to launch metals based on filetype
		config = function(self, metals_config)
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = self.ft,
				callback = function()
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})

			-- Debug using nvim-dap
			local dap = require("dap")
			dap.configurations.scala = {
				{
					type = "scala",
					request = "launch",
					name = "Run",
					metals = {
						runType = "run",
					},
				},
				{
					type = "scala",
					request = "launch",
					name = "Test file",
					metals = {
						runType = "testFile",
					},
				},
				{
					type = "scala",
					request = "launch",
					name = "Test build",
					metals = {
						runType = "testTarget",
					},
				},
			}
		end,
	},

	-- LSP status notifications
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
}
