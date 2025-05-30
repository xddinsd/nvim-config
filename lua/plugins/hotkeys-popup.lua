return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
	config = function()
		require("which-key").setup({
			triggers = {},
		})
	end,
}
