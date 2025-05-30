-- Highlight identation and scope using colored lines

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	commit = "29be0919b91fb59eca9e90690d76014233392bef", -- Lazy.nvim bug with v3 version. https://github.com/lukas-reineke/indent-blankline.nvim/discussions/692
	config = function()
		require("ibl").setup({

			indent = {
				char = "┊",
				-- Highlight is linked to color scheme
				highlight = {
					"keyword",
					"Function",
				},
			},

			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
				char = "│",
				highlight = { "@Keyword" },
			},
		})
	end,
}
