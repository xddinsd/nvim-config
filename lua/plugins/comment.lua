-- Hotkeys to comment lines and blocks of code

return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			-- Adds space between comment and a line
			padding = true,
			-- Cursor stay same position
			sticky = false,
		})
	end,
}
