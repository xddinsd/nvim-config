return {

	{
		-- Snippet engine
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			-- load custom spippets
			require("custom-snippets.loader")
			-- load friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{
		-- Autocomplete
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip", -- Snippet engine
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- Buffer source
			"hrsh7th/cmp-path", -- Path source
			"hrsh7th/cmp-cmdline", -- Command line source
			"saadparwaiz1/cmp_luasnip", -- Snippet source
			"rafamadriz/friendly-snippets", -- Collection of snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local window_transparency = 20
			local hint_max_len = 20

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				-- Adds transparency and borders to autocomplete window
				window = {
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel",
						winblend = window_transparency,
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder",
						winblend = window_transparency,
					}),
				},

				-- Limit autocomplete hint width
				formatting = {
					format = function(entry, vim_item)
						if #vim_item.abbr > hint_max_len then
							vim_item.abbr = string.sub(vim_item.abbr, 1, hint_max_len - 1) .. "…"
						end
						return vim_item
					end,
				},

				-- Key mappings
				mapping = {

					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.get_active_entry() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						elseif luasnip.choice_active() then
							luasnip.change_choice(1)
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},

				-- LSP sources and max items shown as autocomplete hints
				sources = cmp.config.sources({
					{ name = "nvim_lsp", max_item_count = 3 },
					{ name = "luasnip", max_item_count = 3 },
				}, {
					{ name = "buffer", max_item_count = 3 },
					{ name = "path", max_item_count = 3 },
				}),
			})
		end,
	},
}
