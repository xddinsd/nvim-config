return {
	"mhartington/formatter.nvim",

	config = function()
		local util = require("formatter.util")

		-- Format on save
		-- For format via hotkey, use :Format and :FormatWrite
		vim.api.nvim_create_augroup("__formatter__", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})

		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				python = {
					require("formatter.filetypes.python").isort,
					-- require("formatter.filetypes.python").docformatter,
					-- black + line-length=120
					function()
						local util = require("formatter.util")
						return {
							exe = "black",
							args = {
								"-q",
								"--line-length=120",
								"--stdin-filename",
								util.escape_path(util.get_current_buffer_file_name()),
								"-",
							},
							stdin = true,
						}
					end,
				},
				terraform = {
					require("formatter.filetypes.terraform").terraformfmt,
				},
				-- kotlin = {
				-- 	require("formatter.filetypes.kotlin").ktlint,
				-- },
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
