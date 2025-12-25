--[[
  Plugin Configurations Dictionary

  This file contains all plugin configurations in a centralized location.
  Each configuration is stored as a function that can be called by the plugin loader.
]]

local M = {}

-- ================================================================================
-- MODERN COMPLETION
-- ================================================================================

M["blink.cmp"] = function()
	require("blink.cmp").setup({
		keymap = {
			preset = "default",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_next()
					else
						return cmp.show()
					end
				end,
				"snippet_forward",
				"fallback",
			},

			["<S-Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_prev()
					else
						return cmp.show()
					end
				end,
				"snippet_backward",
				"fallback",
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},

		signature = {
			enabled = true,
		},
	})
end

-- ================================================================================
-- NOICE & MODERN UI
-- ================================================================================

M["noice.nvim"] = function()
	require("noice").setup({
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
	})
end

M["nvim-notify"] = function()
	require("notify").setup({
		background_colour = "#000000",
		fps = 30,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = 2,
		minimum_width = 50,
		render = "default",
		stages = "fade_in_slide_out",
		timeout = 5000,
		top_down = true,
	})
end

-- ================================================================================
-- THEME SELECTOR & THEMES
-- ================================================================================

M["themery.nvim"] = function()
	require("themery").setup({
		themes = {
			{
				name = "Tokyo Night",
				colorscheme = "tokyonight",
			},
			{
				name = "Tokyo Night Night",
				colorscheme = "tokyonight-night",
			},
			{
				name = "Tokyo Night Storm",
				colorscheme = "tokyonight-storm",
			},
			{
				name = "Tokyo Night Day",
				colorscheme = "tokyonight-day",
			},
			{
				name = "Catppuccin Latte",
				colorscheme = "catppuccin-latte",
			},
			{
				name = "Catppuccin Frappe",
				colorscheme = "catppuccin-frappe",
			},
			{
				name = "Catppuccin Macchiato",
				colorscheme = "catppuccin-macchiato",
			},
			{
				name = "Catppuccin Mocha",
				colorscheme = "catppuccin-mocha",
			},
			{
				name = "Kanagawa Wave",
				colorscheme = "kanagawa-wave",
			},
			{
				name = "Kanagawa Dragon",
				colorscheme = "kanagawa-dragon",
			},
			{
				name = "Kanagawa Lotus",
				colorscheme = "kanagawa-lotus",
			},
			{
				name = "Rose Pine",
				colorscheme = "rose-pine",
			},
			{
				name = "Rose Pine Moon",
				colorscheme = "rose-pine-moon",
			},
			{
				name = "Rose Pine Dawn",
				colorscheme = "rose-pine-dawn",
			},
			{
				name = "Nightfox",
				colorscheme = "nightfox",
			},
			{
				name = "Dayfox",
				colorscheme = "dayfox",
			},
			{
				name = "Dawnfox",
				colorscheme = "dawnfox",
			},
			{
				name = "Duskfox",
				colorscheme = "duskfox",
			},
			{
				name = "Nordfox",
				colorscheme = "nordfox",
			},
			{
				name = "Terafox",
				colorscheme = "terafox",
			},
			{
				name = "Carbonfox",
				colorscheme = "carbonfox",
			},
			{
				name = "Dracula",
				colorscheme = "dracula",
			},
		},
		themeConfigFile = "~/.config/nvim/lua/config/theme.lua",
		livePreview = true,
	})
end

M["tokyonight.nvim"] = function()
	require("tokyonight").setup({
		style = "night",
		light_style = "day",
		transparent = false,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			sidebars = "dark",
			floats = "dark",
		},
		sidebars = { "qf", "help" },
		day_brightness = 0.3,
		hide_inactive_statusline = false,
		dim_inactive = false,
		lualine_bold = false,
	})
	vim.cmd.colorscheme("tokyonight-night")
end

M["catppuccin"] = function()
	require("catppuccin").setup({
		flavour = "mocha",
		background = {
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		show_end_of_buffer = false,
		term_colors = false,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false,
		no_bold = false,
		no_underline = false,
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = false,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
		},
	})
end

M["kanagawa.nvim"] = function()
	require("kanagawa").setup({
		compile = false,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false,
		dimInactive = false,
		terminalColors = true,
		colors = {
			palette = {},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		theme = "wave",
		background = {
			dark = "wave",
			light = "lotus",
		},
	})
end

M["rose-pine"] = function()
	require("rose-pine").setup({
		variant = "auto",
		dark_variant = "main",
		dim_inactive_windows = false,
		extend_background_behind_borders = true,
		enable = {
			terminal = true,
			legacy_highlights = true,
			migrations = true,
		},
		styles = {
			bold = true,
			italic = true,
			transparency = false,
		},
	})
end

M["nightfox.nvim"] = function()
	require("nightfox").setup({
		options = {
			compile_path = vim.fn.stdpath("cache") .. "/nightfox",
			compile_file_suffix = "_compiled",
			transparent = false,
			terminal_colors = true,
			dim_inactive = false,
			module_default = true,
			colorblind = {
				enable = false,
				simulate_only = false,
				severity = {
					protan = 0,
					deutan = 0,
					tritan = 0,
				},
			},
			styles = {
				comments = "italic",
				conditionals = "NONE",
				constants = "NONE",
				functions = "NONE",
				keywords = "NONE",
				numbers = "NONE",
				operators = "NONE",
				strings = "NONE",
				types = "NONE",
				variables = "NONE",
			},
			inverse = {
				match_paren = false,
				visual = false,
				search = false,
			},
		},
	})
end

M["dracula.nvim"] = function()
	require("dracula").setup({
		colors = {},
		show_end_of_buffer = true,
		transparent_bg = false,
		lualine_bg_color = "#44475a",
		italic_comment = true,
	})
end

-- ================================================================================
-- GIT & GITLAB INTEGRATION
-- ================================================================================

M["neogit"] = function()
	local neogit = require("neogit")
	neogit.setup({
		disable_signs = false,
		disable_hint = false,
		disable_context_highlighting = false,
		disable_commit_confirmation = false,
		auto_refresh = true,
		sort_branches = "-committerdate",
		disable_builtin_notifications = false,
		use_magit_keybindings = false,
		commit_popup = {
			kind = "split",
		},
		commit_select_view = {
			kind = "tab",
		},
		kind = "tab",
		signs = {
			hunk = { "", "" },
			item = { ">", "v" },
			section = { ">", "v" },
		},
		integrations = {
			telescope = true,
			diffview = true,
		},
		sections = {
			sequencer = {
				folded = false,
				hidden = false,
			},
			untracked = {
				folded = false,
				hidden = false,
			},
			unstaged = {
				folded = false,
				hidden = false,
			},
			staged = {
				folded = false,
				hidden = false,
			},
			stashes = {
				folded = true,
				hidden = false,
			},
			unpulled_upstream = {
				folded = true,
				hidden = false,
			},
			unmerged_upstream = {
				folded = false,
				hidden = false,
			},
			unpulled_pushRemote = {
				folded = true,
				hidden = false,
			},
			unmerged_pushRemote = {
				folded = false,
				hidden = false,
			},
			recent = {
				folded = true,
				hidden = false,
			},
			rebase = {
				folded = true,
				hidden = false,
			},
		},
	})
end

M["gitlab.nvim"] = function()
	require("gitlab").setup({
		port = nil,
		log_path = vim.fn.stdpath("cache") .. "/gitlab.nvim.log",
		config_path = nil,
		debug = { go_request = false, go_response = false },
		attachment_dir = nil,
		popup = {
			exit = "<Esc>",
			perform_action = "<leader>s",
			perform_linewise_action = "<leader>l",
		},
		discussion_tree = {
			auto_open = true,
			default_expanded = true,
			switch_view = "S",
			toggle_all_discussions = "dd",
			toggle_resolved_discussions = "dr",
			toggle_unresolved_discussions = "du",
			keep_current_open = false,
			resolved = "✓",
			unresolved = "-",
			tree_type = "simple",
			toggle_tree_type = "i",
			position = "left",
			size = "20%",
			relative = "editor",
			resolved_expanded = false,
			unresolved_expanded = true,
			jump_to_reviewer = "m",
			jump_to_file = "o",
			edit_comment = "e",
			delete_comment = "dd",
			reply = "r",
			toggle_all_discussions = "T",
			toggle_resolved = "R",
			toggle_draft = "D",
		},
	})
end

M["diffview.nvim"] = function()
	require("diffview").setup({
		diff_binaries = false,
		enhanced_diff_hl = false,
		git_cmd = { "git" },
		hg_cmd = { "hg" },
		use_icons = true,
		show_help_hints = true,
		watch_index = true,
		icons = {
			folder_closed = "",
			folder_open = "",
		},
		signs = {
			fold_closed = "",
			fold_open = "",
			done = "✓",
		},
	})
end

M["git-blame.nvim"] = function()
	require("gitblame").setup({
		enabled = true,
		message_template = " <summary> • <date> • <author>",
		date_format = "%m-%d-%Y %H:%M:%S",
		virtual_text_column = nil,
		display_virtual_text = true,
		ignore_whitespace = false,
		message_when_not_committed = "  Oh please, commit this !",
		highlight_group = "Question",
		set_extmark_options = {},
		delay = 1000,
		use_blame_commit_file_urls = false,
	})
end

-- ================================================================================
-- JUPYTER NOTEBOOK
-- ================================================================================
M["molten-nvim-init"] = function()
    vim.g.molten_auto_open_output = false
    vim.g.molten_enter_output_behavior = "open_and_enter"
    vim.g.molten_image_location = "float"
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_border = { "", "━", "", "" }
    vim.g.molten_output_win_max_height = 12
    vim.g.molten_virt_text_output = true
    vim.g.molten_use_border_highlights = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_wrap_output = true
    vim.g.molten_tick_rate = 142


    vim.api.nvim_create_autocmd("User", {
        pattern = "MoltenInitPost",
        callback = function()
            local r = require("quarto.runner")

            if vim.bo.filetype == "python" then
                vim.fn.MoltenUpdateOption("molten_virt_lines_off_by_1", false)
                vim.fn.MoltenUpdateOption("molten_virt_text_output", false)
            end
        end,
    })

    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.py",
        callback = function(e)
            if string.match(e.file, ".otter.") then
                return
            end
            if require("molten.status").initialized() == "Molten" then
                vim.fn.MoltenUpdateOption("molten_virt_lines_off_by_1", false)
                vim.fn.MoltenUpdateOption("molten_virt_text_output", false)
            end
        end,
    })

    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.qmd", "*.md", "*.ipynb" },
        callback = function()
            if require("molten.status").initialized() == "Molten" then
                vim.fn.MoltenUpdateOption("molten_virt_lines_off_by_1", true)
                vim.fn.MoltenUpdateOption("molten_virt_text_output", true)
            end
        end,
    })

    local imb = function(e)
        vim.schedule(function()
            local kernels = vim.fn.MoltenAvailableKernels()

            local try_kernel_name = function()
                local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
                return metadata.kernelspec.name
            end
            local ok, kernel_name = pcall(try_kernel_name)

            if not ok or not vim.tbl_contains(kernels, kernel_name) then
                kernel_name = nil
                local venv = os.getenv("VIRTUAL_ENV")
                if venv ~= nil then
                    kernel_name = string.match(venv, "/.+/(.+)")
                end
            end

            if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
                vim.cmd(("MoltenInit %s"):format(kernel_name))
            end
            vim.cmd("MoltenImportOutput")
        end)
    end
end

M["molten-nvim-config"] = function()
    vim.api.nvim_create_user_command("MoltenInitPython", function()
        vim.cmd("MoltenInit python3")
    end, {})
end

M["image.nvim"] = function()
    local image = require("image")

    ---@diagnostic disable-next-line: missing-fields
    image.setup({
        backend = "kitty",
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = false,
                only_render_image_at_cursor = false,
                filetypes = { "markdown", "quarto" }, -- markdown extensions (ie. quarto) can go here
            },
            neorg = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = false,
                only_render_image_at_cursor = false,
                filetypes = { "norg" },
            },
        },
        max_width = 100,
        max_height = 8,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
        editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "fidget", "" },
    })
end

M["jupytext.nvim"] = {
    style = "markdown",
    output_extension = "md",
    force_ft = "markdown",
}

M["quatro-nvim"] = function()
    local quarto = require("quarto")
    quarto.setup({
        lspFeatures = {
            languages = { "python", "lua" },
            chunks = "all", -- 'curly' or 'all'
            diagnostics = {
                enabled = true,
                triggers = { "BufWritePost" },
            },
            completion = {
                enabled = true,
            },
        },
        keymap = {
            hover = "H",
            definition = "gd",
            rename = "<leader>rn",
            references = "gr",
            format = "<leader>gf",
        },
        codeRunner = {
            enabled = true,
            ft_runners = {
                bash = "slime",
            },
            default_method = "molten",
        },
    })

    -- for more keybinds that I would use in a quarto document, see the configuration for molten
    require("benlubas.hydra.notebook")
end

-- ================================================================================
-- DATA ENGINEERING & DEVOPS
-- ================================================================================

M["lazydocker.nvim"] = function()
	require("lazydocker").setup({
		border = "rounded",
		width_ratio = 0.9,
		height_ratio = 0.9,
	})
end

M["kubectl.nvim"] = function()
	require("kubectl").setup({
		log_level = vim.log.levels.INFO,
		auto_refresh = {
			enabled = true,
			interval = 300,
		},
		diff = {
			bin = "delta",
		},
		kubectl_cmd = { cmd = "kubectl", env = {}, args = {} },
		namespace = "default",
		hints = true,
		context = true,
		heartbeat = true,
		lineage = {
			enabled = false,
		},
		logs = {
			prefix = true,
			timestamps = true,
		},
	})
end

M["yaml-companion.nvim"] = function()
	require("yaml-companion").setup({
		lspconfig = {
			cmd = { "yaml-language-server", "--stdio" },
			filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
			capabilities = vim.lsp.protocol.make_client_capabilities(),
		},
		builtin_matchers = {
			kubernetes = { enabled = true },
			cloud_init = { enabled = true },
		},
	})

	require("telescope").load_extension("yaml_schema")
end

M["rest.nvim"] = function()
	require("rest-nvim").setup({
		result_split_horizontal = false,
		result_split_in_place = false,
		stay_in_current_window_after_split = false,
		skip_ssl_verification = false,
		encode_url = true,
		highlight = {
			enabled = true,
			timeout = 150,
		},
		result = {
			show_url = true,
			show_curl_command = false,
			show_http_info = true,
			show_headers = true,
			show_statistics = false,
			formatters = {
				json = "jq",
				html = function(body)
					return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
				end,
			},
		},
		jump_to_request = false,
		env_file = ".env",
		custom_dynamic_variables = {},
		yank_dry_run = true,
	})
end

M["s3edit.nvim"] = function()
	require("s3edit").setup({
		connections = {
			{
				name = "minio-local",
				endpoint = "http://localhost:9000",
				access_key_id = "minioadmin",
				secret_access_key = "minioadmin",
				region = "us-east-1",
			},
		},
	})
end

-- ================================================================================
-- SCALA & METALS
-- ================================================================================

M["nvim-metals"] = function()
	local metals = require("metals")

	local metals_config = metals.bare_config()

	metals_config.settings = {
		showImplicitArguments = true,
		showImplicitConversionsAndClasses = true,
		showInferredType = true,
		superMethodLensesEnabled = true,
		enableSemanticHighlighting = true,
	}

	metals_config.init_options.statusBarProvider = "off"
	metals_config.capabilities = vim.lsp.protocol.make_client_capabilities()

	metals_config.on_attach = function(client, bufnr)
		metals.setup_dap()
	end

	local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "scala", "sbt" },
		callback = function()
			metals.initialize_or_attach(metals_config)
		end,
		group = nvim_metals_group,
	})

	local dap = require("dap")
	dap.configurations.scala = {
		{
			type = "scala",
			request = "launch",
			name = "Run or Test File",
			metals = {
				runType = "runOrTestFile",
			},
		},
		{
			type = "scala",
			request = "launch",
			name = "Test Target",
			metals = {
				runType = "testTarget",
			},
		},
	}
end

-- ================================================================================
-- ENHANCED CODE EDITING
-- ================================================================================

M["actions-preview.nvim"] = function()
	require("actions-preview").setup({
		diff = {
			algorithm = "patience",
			ignore_whitespace = true,
		},
		highlight_command = {
			require("actions-preview.highlight").delta(),
		},
		telescope = {
			sorting_strategy = "ascending",
			layout_strategy = "vertical",
			layout_config = {
				width = 0.8,
				height = 0.9,
				prompt_position = "top",
				preview_cutoff = 20,
				preview_height = function(_, _, max_lines)
					return max_lines - 15
				end,
			},
		},
	})
end

M["inc-rename.nvim"] = function()
	require("inc_rename").setup({
		cmd_name = "IncRename",
		hl_group = "Substitute",
		preview_empty_name = false,
		show_message = true,
		input_buffer_type = nil,
		post_hook = nil,
	})
end

M["outline.nvim"] = function()
	require("outline").setup({
		outline_window = {
			position = "right",
			width = 25,
			relative_width = true,
			auto_close = false,
			auto_jump = false,
			jump_highlight_duration = 300,
			center_on_jump = true,
			show_numbers = false,
			show_relative_numbers = false,
			wrap = false,
			focus_on_open = true,
			winhl = "",
		},
		outline_items = {
			show_symbol_details = true,
			show_symbol_lineno = false,
			highlight_hovered_item = true,
			auto_set_cursor = true,
			auto_update_events = {
				follow = { "CursorMoved" },
				items = { "InsertLeave", "WinEnter", "BufEnter", "BufWinEnter", "TabEnter", "BufWritePost" },
			},
		},
		guides = {
			enabled = true,
			markers = {
				bottom = "└",
				middle = "├",
				vertical = "│",
			},
		},
		symbol_folding = {
			autofold_depth = 1,
			auto_unfold_hover = true,
			markers = { "", "" },
		},
		preview_window = {
			auto_preview = false,
			open_hover_on_preview = false,
			width = 50,
			min_width = 50,
			relative_width = true,
			border = "single",
			winhl = "NormalFloat:",
			live = false,
		},
		keymaps = {},
		providers = {
			priority = { "lsp", "coc", "markdown", "norg" },
			lsp = {
				blacklist_clients = {},
			},
		},
	})
end

M["vim-visual-multi"] = function()
	vim.g.VM_maps = {
		["Find Under"] = "<C-d>",
		["Find Subword Under"] = "<C-d>",
		["Select Cursor Down"] = "<M-C-Down>",
		["Select Cursor Up"] = "<M-C-Up>",
		["Add Cursor Down"] = "<M-Down>",
		["Add Cursor Up"] = "<M-Up>",
	}
end

M["mini.ai"] = function()
	require("mini.ai").setup({
		custom_textobjects = {
			o = require("mini.ai").gen_spec.treesitter({
				a = { "@block.outer", "@conditional.outer", "@loop.outer" },
				i = { "@block.inner", "@conditional.inner", "@loop.inner" },
			}, {}),
			f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
			c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
			t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
			d = { "%f[%d]%d+" },
			e = {
				{
					"%u[%l%d]+%f[^%l%d]",
					"%f[%S][%l%d]+%f[^%l%d]",
					"%f[%P][%l%d]+%f[^%l%d]",
					"^[%l%d]+%f[^%l%d]",
				},
				"^().*()$",
			},
			i = require("mini.ai").gen_spec.treesitter({
				a = "@call.outer",
				i = "@call.inner",
			}, {}),
			k = require("mini.ai").gen_spec.treesitter({
				a = "@block.outer",
				i = "@block.inner",
			}, {}),
			u = require("mini.ai").gen_spec.function_call(),
			U = require("mini.ai").gen_spec.function_call({ name_pattern = "[%w_]" }),
		},
		n_lines = 50,
		search_method = "cover_or_next",
	})
end

M["nvim-surround"] = function()
	require("nvim-surround").setup({
		keymaps = {
			insert = "<C-g>s",
			insert_line = "<C-g>S",
			normal = "ys",
			normal_cur = "yss",
			normal_line = "yS",
			normal_cur_line = "ySS",
			visual = "S",
			visual_line = "gS",
			delete = "ds",
			change = "cs",
			change_line = "cS",
		},
		aliases = {
			["a"] = ">",
			["b"] = ")",
			["B"] = "}",
			["r"] = "]",
			["q"] = { '"', "'", "`" },
			["s"] = { "}", "]", ")", ">", '"', "'", "`" },
		},
		highlight = {
			duration = 0,
		},
		move_cursor = "begin",
		indent_lines = function(start, stop)
			local b = vim.bo
			if b.expandtab then
				return true
			end
			local count = math.min(b.shiftwidth, b.tabstop)
			return count > 0 and (stop - start) > count
		end,
	})
end

-- ================================================================================
-- PROJECT & SESSION MANAGEMENT
-- ================================================================================

M["project.nvim"] = function()
	require("project_nvim").setup({
		detection_methods = { "lsp", "pattern" },
		patterns = {
			".git",
			"_darcs",
			".hg",
			".bzr",
			".svn",
			"Makefile",
			"package.json",
			"pom.xml",
			"build.gradle",
			"Cargo.toml",
		},
		ignore_lsp = {},
		exclude_dirs = {},
		show_hidden = false,
		silent_chdir = true,
		scope_chdir = "global",
		datapath = vim.fn.stdpath("data"),
	})
	require("telescope").load_extension("projects")
end

M["persistence.nvim"] = function()
	require("persistence").setup({
		dir = vim.fn.stdpath("state") .. "/sessions/",
		need = 1,
		branch = true,
	})
end

M["uv.nvim"] = function()
    require('uv').setup({
        auto_activate_venv = true,
        notify_activate_venv = true,
        picker_integration = true,
        keymaps = {
            prefix = "<leader>Dpu",
        }
    })
end

-- ================================================================================
-- DIAGNOSTICS & TROUBLE
-- ================================================================================

M["trouble.nvim"] = function()
	require("trouble").setup({
		position = "bottom",
		height = 10,
		width = 50,
		mode = "workspace_diagnostics",
		severity = nil,
		fold_open = "",
		fold_closed = "",
		group = true,
		padding = true,
		cycle_results = true,
		action_keys = {
			close = "q",
			cancel = "<esc>",
			refresh = "r",
			jump = { "<cr>", "<tab>", "<2-leftmouse>" },
			open_split = { "<c-x>" },
			open_vsplit = { "<c-v>" },
			open_tab = { "<c-t>" },
			jump_close = { "o" },
			toggle_mode = "m",
			switch_severity = "s",
			toggle_preview = "P",
			hover = "K",
			preview = "p",
			open_code_href = "c",
			close_folds = { "zM", "zm" },
			open_folds = { "zR", "zr" },
			toggle_fold = { "zA", "za" },
			previous = "k",
			next = "j",
		},
		multiline = true,
		indent_lines = true,
		win_config = { border = "single" },
		auto_open = false,
		auto_close = false,
		auto_preview = true,
		auto_fold = false,
		auto_jump = { "lsp_definitions" },
		include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" },
		signs = {
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "",
		},
		use_diagnostic_signs = false,
	})
end

M["nvim-bqf"] = function()
	require("bqf").setup({
		auto_enable = true,
		auto_resize_height = true,
		preview = {
			win_height = 12,
			win_vheight = 12,
			delay_syntax = 80,
			border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
			show_title = false,
			should_preview_cb = function(bufnr, qwinid)
				local ret = true
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				local fsize = vim.fn.getfperm(bufname):match("^.[-r][-w][-x]")
				if fsize == nil or (fsize and vim.fn.getfsize(bufname) > 100 * 1024) then
					ret = false
				end
				return ret
			end,
		},
		func_map = {
			drop = "o",
			openc = "O",
			split = "<C-s>",
			vsplit = "<C-v>",
			tab = "t",
			tabb = "T",
			tabc = "<C-t>",
			tabdrop = "",
			ptogglemode = "z,",
			pscrollup = "<C-u>",
			pscrolldown = "<C-d>",
			pscrollorig = "zo",
			prevfile = "<C-p>",
			nextfile = "<C-n>",
			prevhist = "<",
			nexthist = ">",
			lastleave = [['"]],
			stoggleup = "<S-Tab>",
			stoggledown = "<Tab>",
			stogglevm = "<Tab>",
			stogglebuf = [['<Tab>]],
			sclear = "z<Tab>",
			filter = "zn",
			filterr = "zN",
			fzffilter = "zf",
		},
		filter = {
			fzf = {
				action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
				extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
			},
		},
	})
end

-- ================================================================================
-- TESTING & DEBUGGING
-- ================================================================================

M["neotest"] = function()
	require("neotest").setup({
		adapters = {
			require("neotest-python")({
				dap = { justMyCode = false },
				args = { "--log-level", "DEBUG" },
				runner = "pytest",
				python = ".venv/bin/python",
			}),
			require("neotest-java")({
				ignore_wrapper = false,
			}),
		},
		benchmark = {
			enabled = true,
		},
		consumers = {},
		default_strategy = "integrated",
		diagnostic = {
			enabled = true,
			severity = 1,
		},
		discovery = {
			concurrent = 0,
			enabled = true,
		},
		floating = {
			border = "rounded",
			max_height = 0.6,
			max_width = 0.6,
			options = {},
		},
		highlights = {
			adapter_name = "NeotestAdapterName",
			border = "NeotestBorder",
			dir = "NeotestDir",
			expand_marker = "NeotestExpandMarker",
			failed = "NeotestFailed",
			file = "NeotestFile",
			focused = "NeotestFocused",
			indent = "NeotestIndent",
			marked = "NeotestMarked",
			namespace = "NeotestNamespace",
			passed = "NeotestPassed",
			running = "NeotestRunning",
			select_win = "NeotestWinSelect",
			skipped = "NeotestSkipped",
			target = "NeotestTarget",
			test = "NeotestTest",
			unknown = "NeotestUnknown",
		},
		icons = {
			child_indent = "│",
			child_prefix = "├",
			collapsed = "─",
			expanded = "╮",
			failed = "",
			final_child_indent = " ",
			final_child_prefix = "╰",
			non_collapsible = "─",
			passed = "",
			running = "",
			running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
			skipped = "",
			unknown = "",
		},
		jump = {
			enabled = true,
		},
		log_level = 3,
		output = {
			enabled = true,
			open_on_run = "short",
		},
		output_panel = {
			enabled = true,
			open = "botright split | resize 15",
		},
		quickfix = {
			enabled = true,
			open = false,
		},
		run = {
			enabled = true,
		},
		running = {
			concurrent = true,
		},
		state = {
			enabled = true,
		},
		status = {
			enabled = true,
			signs = true,
			virtual_text = false,
		},
		strategies = {
			integrated = {
				height = 40,
				width = 120,
			},
		},
		summary = {
			animated = true,
			enabled = true,
			expand_errors = true,
			follow = true,
			mappings = {
				attach = "a",
				clear_marked = "M",
				clear_target = "T",
				debug = "d",
				debug_marked = "D",
				expand = { "<CR>", "<2-LeftMouse>" },
				expand_all = "e",
				jumpto = "i",
				mark = "m",
				next_failed = "J",
				output = "o",
				prev_failed = "K",
				run = "r",
				run_marked = "R",
				short = "O",
				stop = "u",
				target = "t",
				watch = "w",
			},
			open = "botright vsplit | vertical resize 50",
		},
	})
end

M["nvim-coverage"] = function()
	require("coverage").setup({
		commands = true,
		highlights = {
			covered = { fg = "#C3E88D" },
			uncovered = { fg = "#F07178" },
		},
		signs = {
			covered = { hl = "CoverageCovered", text = "▎" },
			uncovered = { hl = "CoverageUncovered", text = "▎" },
		},
		summary = {
			min_coverage = 80.0,
		},
		lang = {
			python = {
				coverage_command = "coverage json --fail-under=0 -q -o -",
			},
		},
	})
end

M["nvim-dap"] = function()
	local dap = require("dap")

	vim.fn.sign_define("DapBreakpoint", {
		text = "●",
		texthl = "Error",
		linehl = "",
		numhl = "",
	})
	vim.fn.sign_define("DapStopped", {
		text = "●",
		texthl = "WarningMsg",
		linehl = "",
		numhl = "",
	})
	vim.fn.sign_define("DapBreakpointCondition", {
		text = "●",
		texthl = "Conditional",
		linehl = "",
		numhl = "",
	})
	vim.fn.sign_define("DapBreakpointRejected", {
		text = "",
		texthl = "Error",
		linehl = "",
		numhl = "",
	})
	vim.fn.sign_define("DapLogPoint", {
		text = ".>",
		texthl = "Title",
		linehl = "",
		numhl = "",
	})
end

M["nvim-dap-ui"] = function()
	local dap, dapui = require("dap"), require("dapui")

	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end

	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end

	dapui.setup({
		controls = {
			element = "repl",
			enabled = true,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = "",
			},
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = "",
		},
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.25,
					},
					{
						id = "breakpoints",
						size = 0.25,
					},
					{
						id = "stacks",
						size = 0.25,
					},
					{
						id = "watches",
						size = 0.25,
					},
				},
				position = "left",
				size = 40,
			},
			{
				elements = {
					{
						id = "repl",
						size = 0.5,
					},
					{
						id = "console",
						size = 0.5,
					},
				},
				position = "bottom",
				size = 10,
			},
		},
		mappings = {
			edit = "e",
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t",
		},
		render = {
			indent = 1,
			max_value_lines = 100,
		},
	})
end

M["nvim-dap-python"] = function()
	local dap_python = require("dap-python")
	local python_path = "/usr/bin/python3"
	dap_python.setup(python_path)
end

-- ================================================================================
-- UI ENHANCEMENTS
-- ================================================================================

M["lualine.nvim"] = function()
	local lualine = require("lualine")
	lualine.setup({
		options = {
			theme = "auto",
			section_separators = { left = "|", right = "|" },
			component_separators = { left = "|", right = "|" },
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{ "filename", path = 1, shorting_target = 40 },
				{
					"lsp_progress",
					separators = {
						component = " ",
						progress = " | ",
						percentage = { pre = "", post = "%% " },
						title = { pre = "", post = ": " },
						message = { pre = "(", post = ")", commenced = "In Progress", completed = "Completed" },
						spinner = { pre = "", post = "" },
						lsp_client_name = { pre = "[", post = "]" },
					},
					display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
					colors = { use = true },
					timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
					spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
				},
			},
			lualine_x = {
				{
					"filetype",
					colored = true,
					icon_only = false,
					icon = { align = "right" },
				},
				"encoding",
				"fileformat",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = { "nvim-tree", "toggleterm", "trouble" },
	})
end

M["indent-blankline.nvim"] = function()
	require("ibl").setup({
		indent = {
			char = "┊",
			tab_char = "┊",
			highlight = {
				"CursorColumn",
				"Whitespace",
			},
			smart_indent_cap = true,
			priority = 2,
		},
		whitespace = {
			highlight = {
				"CursorColumn",
				"Whitespace",
			},
			remove_blankline_trail = true,
		},
		scope = {
			enabled = true,
			char = "│",
			show_start = false,
			show_end = false,
			show_exact_scope = false,
			injected_languages = true,
			highlight = { "Function", "Label" },
			priority = 1024,
			include = {
				node_type = {
					["*"] = { "*" },
				},
			},
			exclude = {
				language = {},
				node_type = {
					["*"] = {
						"source_file",
						"program",
					},
					lua = {
						"chunk",
					},
					python = {
						"module",
					},
				},
			},
		},
	})
end

M["dressing.nvim"] = function()
	require("dressing").setup({
		input = {
			enabled = true,
			default_prompt = "Input",
			trim_prompt = true,
			title_pos = "left",
			start_mode = "insert",
			border = "rounded",
			relative = "cursor",
			prefer_width = 40,
			width = nil,
			max_width = { 140, 0.9 },
			min_width = { 20, 0.2 },
			buf_options = {},
			win_options = {
				wrap = false,
				list = true,
				listchars = "precedes:…,extends:…",
				sidescrolloff = 0,
			},
			mappings = {
				n = {
					["<Esc>"] = "Close",
					["<CR>"] = "Confirm",
				},
				i = {
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
					["<Up>"] = "HistoryPrev",
					["<Down>"] = "HistoryNext",
				},
			},
			override = function(conf)
				return conf
			end,
			get_config = nil,
		},
		select = {
			enabled = true,
			backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
			trim_prompt = true,
			telescope = require("telescope.themes").get_dropdown({ winblend = 10, previewer = false }),
			fzf = {
				window = {
					width = 0.5,
					height = 0.4,
				},
			},
			fzf_lua = {},
			nui = {
				position = "50%",
				size = nil,
				relative = "editor",
				border = {
					style = "rounded",
				},
				buf_options = {
					swapfile = false,
					filetype = "DressingSelect",
				},
				win_options = {
					winblend = 50,
				},
				max_width = 80,
				max_height = 40,
				min_width = 40,
				min_height = 10,
			},
			builtin = {
				show_numbers = true,
				border = "rounded",
				relative = "editor",
				buf_options = {},
				win_options = {
					cursorline = true,
					cursorlineopt = "both",
					winhighlight = "MatchParen:",
					statuscolumn = " ",
				},
				width = nil,
				max_width = { 140, 0.8 },
				min_width = { 40, 0.2 },
				height = nil,
				max_height = 0.9,
				min_height = { 10, 0.2 },
				mappings = {
					["<Esc>"] = "Close",
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
				},
				override = function(conf)
					return conf
				end,
			},
			format_item_override = {},
			get_config = nil,
		},
	})
end

M["alpha-nvim"] = function()
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		" ",
		"  ███╗   ██╗██╗ ██████╗  ██████╗ ███████╗██████╗",
		"  ████╗  ██║██║██╔════╝ ██╔════╝ ██╔════╝██╔══██╗",
		"  ██╔██╗ ██║██║██║  ███╗██║  ███╗█████╗  ██████╔╝",
		"  ██║╚██╗██║██║██║   ██║██║   ██║██╔══╝  ██╔══██╗",
		"  ██║ ╚████║██║╚██████╔╝╚██████╔╝███████╗██║  ██║",
		"  ╚═╝  ╚═══╝╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝",
		" ",
		"    🚀 Modern Data Engineering IDE 🚀",
		" ",
	}

	dashboard.section.buttons.val = {
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("p", "  Open project", ":Telescope projects <CR>"),
		dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
		dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
		dashboard.button("s", "  Restore session", ":lua require('persistence').load() <CR>"),
		dashboard.button("h", "  Theme selector", ":Themery <CR>"),
		dashboard.button("q", "  Quit", ":qa<CR>"),
	}

	dashboard.section.footer.val = "⚡️ Ready for Data Engineering!"
	dashboard.opts.opts.noautocmd = true

	require("alpha").setup(dashboard.opts)
end

M["nvim-ufo"] = function()
	vim.o.foldcolumn = "1"
	vim.o.foldlevel = 99
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true
	require("ufo").setup({
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	})
end

M["neoscroll.nvim"] = function()
	require("neoscroll").setup({
		mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
		hide_cursor = true,
		stop_eof = true,
		respect_scrolloff = false,
		cursor_scrolls_alone = true,
		easing_function = nil,
		pre_hook = nil,
		post_hook = nil,
		performance_mode = false,
	})
end

M["nvim-colorizer.lua"] = function()
	require("colorizer").setup({
		"*",
		css = { rgb_fn = true },
		html = { names = false },
	}, {
		RGB = true,
		RRGGBB = true,
		names = true,
		RRGGBBAA = false,
		AARRGGBB = false,
		rgb_fn = false,
		hsl_fn = false,
		css = false,
		css_fn = false,
		mode = "background",
		tailwind = false,
		sass = { enable = false, parsers = { css } },
		virtualtext = "■",
	})
end

M["incline.nvim"] = function()
	require("incline").setup({
		debounce_threshold = {
			falling = 50,
			rising = 10,
		},
		hide = {
			cursorline = false,
			focused_win = false,
			only_win = false,
		},
		highlight = {
			groups = {
				InclineNormal = {
					default = true,
					group = "NormalFloat",
				},
				InclineNormalNC = {
					default = true,
					group = "NormalFloat",
				},
			},
		},
		ignore = {
			buftypes = "special",
			filetypes = {},
			floating_wins = true,
			unlisted_buffers = true,
			wintypes = "special",
		},
		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
			if filename == "" then
				filename = "[No Name]"
			end
			local ft_icon, ft_color = require("mini.icons").get("file", filename)
			return {
				ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = "white" } or "",
				" ",
				filename,
				" ",
			}
		end,
		window = {
			margin = {
				horizontal = 1,
				vertical = 1,
			},
			options = {
				signcolumn = "no",
				wrap = false,
			},
			padding = 1,
			padding_char = " ",
			placement = {
				horizontal = "right",
				vertical = "top",
			},
			width = "fit",
			winhighlight = {
				active = {
					EndOfBuffer = "None",
					Normal = "InclineNormal",
					Search = "None",
				},
				inactive = {
					EndOfBuffer = "None",
					Normal = "InclineNormalNC",
					Search = "None",
				},
			},
			zindex = 50,
		},
	})
end

M["codewindow.nvim"] = function()
	local codewindow = require("codewindow")
	codewindow.setup({
		auto_enable = false,
		minimap_width = 20,
		width_multiplier = 4,
		use_lsp = true,
		use_treesitter = true,
		use_git = true,
		show_cursor = true,
		screen_bounds = "lines",
		window_border = "single",
		relative = "editor",
		events = { "TextChanged", "InsertLeave", "DiagnosticChanged", "FileWritePost" },
		exclude_filetypes = { "help" },
	})
end

-- ================================================================================
-- NAVIGATION & SEARCH
-- ================================================================================

M["flash.nvim"] = function()
	require("flash").setup({
		labels = "asdfghjklqwertyuiopzxcvbnm",
		search = {
			multi_window = true,
			forward = true,
			wrap = true,
			mode = "exact",
			incremental = false,
			exclude = {
				"notify",
				"cmp_menu",
				"noice",
				"flash_prompt",
				function(win)
					return not vim.api.nvim_win_get_config(win).focusable
				end,
			},
			trigger = "",
			max_length = false,
		},
		jump = {
			jumplist = true,
			pos = "start",
			history = false,
			register = false,
			nohlsearch = false,
			autojump = false,
			inclusive = nil,
			offset = nil,
		},
		label = {
			uppercase = true,
			exclude = "",
			current = true,
			after = true,
			before = false,
			style = "overlay",
			reuse = "lowercase",
			distance = true,
			min_pattern_length = 0,
			rainbow = {
				enabled = false,
				shade = 5,
			},
			format = function(opts)
				return { { opts.match.label, opts.hl_group } }
			end,
		},
		highlight = {
			backdrop = true,
			matches = true,
			priority = 5000,
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},
		action = nil,
		pattern = "",
		continue = false,
		config = nil,
		prompt = {
			enabled = true,
			prefix = { { "⚡️", "FlashPromptIcon" } },
			win_config = {
				relative = "editor",
				width = 1,
				height = 1,
				row = -1,
				col = 0,
				zindex = 1000,
			},
		},
		remote_op = {
			restore = true,
			motion = true,
		},
	})
end

M["harpoon"] = function()
	local harpoon = require("harpoon")
	harpoon:setup({
		settings = {
			save_on_toggle = true,
			sync_on_ui_close = true,
			key = function()
				return vim.loop.cwd()
			end,
		},
		default = {
			get_root_dir = function()
				return vim.loop.cwd()
			end,
			select = function(list_item, list, options)
				options = options or {}
				vim.cmd("edit " .. list_item.value)
			end,
		},
	})
end

M["grug-far.nvim"] = function()
	require("grug-far").setup({
		headerMaxWidth = 80,
		resultsSeparatorLineChar = "-",
		spinnerStates = {
			"|",
			"/",
			"-",
			"\\",
		},
		folding = {
			enabled = true,
			foldopen = "v",
			foldclose = ">",
		},
		wrap = true,
		transient = false,
		windowCreationCommand = "tabnew %",
		engines = {
			ripgrep = {
				path = "rg",
				extraArgs = "",
				showReplaceDiff = true,
				placeholders = {
					enabled = true,
					search = "ex: foo   foo([a-z0-9]*)   fun\\(",
					replacement = "ex: bar   ${1}_foo   $$MY_ENV_VAR   fun\\(",
					replacement_lua = 'ex: if vim.startswith(match, "use") then return "employ" .. match:sub(4) end',
					filesFilter = "ex: *.lua   *.{css,js}   **/docs/*.md   (specify one per line)",
					flags = "ex: --help --ignore-case (-i) --word-boundary (-w) --multiline (-U)",
					paths = "ex: /foo/bar   ../   ./hello\\ world/   ./src/foo/   (specify one per line)",
				},
			},
			astgrep = {
				path = "sg",
				extraArgs = "",
				showReplaceDiff = true,
				placeholders = {
					enabled = true,
					search = "ex: console.log($A)   <img src=$S />   function $F() { $$$ARGS }",
					replacement = 'ex: logger.log($A)   <img alt="image" src=$S />   const $F = ($$$ARGS) => {}',
					filesFilter = "ex: *.lua   *.{css,js}   **/docs/*.md   (specify one per line)",
					flags = "ex: --help --debug (-d) --strictness=<STRICTNESS>",
					paths = "ex:/foo/bar   ../   ./hello\\ world/   ./src/foo/   (specify one per line)",
				},
			},
		},
		keymaps = {
			replace = { n = "<localleader>r" },
			qflist = { n = "<localleader>q" },
			syncLocations = { n = "<localleader>s" },
			syncLine = { n = "<localleader>l" },
			close = { n = "<localleader>c" },
			historyOpen = { n = "<localleader>t" },
			historyAdd = { n = "<localleader>a" },
			refresh = { n = "<localleader>f" },
			openLocation = { n = "<localleader>o" },
			gotoLocation = { n = "<enter>" },
			pickHistoryEntry = { n = "<enter>" },
			abort = { n = "<localleader>b" },
			help = { n = "g?" },
			toggleShowCommand = { n = "<localleader>p" },
			swapEngine = { n = "<localleader>e" },
			previewLocation = { n = "<localleader>i" },
		},
		startCursorRow = 4,
		prefills = {
			paths = "",
			search = "",
			replacement = "",
			filesFilter = "",
			flags = "",
		},
		icons = {
			enabled = true,
			actionEntryBullet = "  ",
			searchInput = " ",
			replaceInput = " ",
			filesFilterInput = " ",
			flagsInput = " ",
			resultsStatusReady = " ",
			resultsStatusError = " ",
			resultsStatusSuccess = " ",
			resultsActionMessage = "  ",
			historyTitle = " ",
			resultsChangeIndicator = "┃",
			pathsTitle = " ",
			resultsTitle = " ",
			resultsAddedIcon = "",
			resultsRemovedIcon = "",
			resultsDiffSeparatorIndicator = "┊",
		},
	})
end

M["telescope.nvim"] = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "truncate" },
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-c>"] = actions.close,
					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["<CR>"] = actions.select_default,
					["<C-x>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,
					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,
					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,
					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["<C-l>"] = actions.complete_tag,
					["<C-_>"] = actions.which_key,
				},
				n = {
					["<esc>"] = actions.close,
					["<CR>"] = actions.select_default,
					["<C-x>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,
					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["H"] = actions.move_to_top,
					["M"] = actions.move_to_middle,
					["L"] = actions.move_to_bottom,
					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["gg"] = actions.move_to_top,
					["G"] = actions.move_to_bottom,
					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,
					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,
					["?"] = actions.which_key,
				},
			},
		},
		pickers = {
			find_files = {
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
			},
		},
		extensions = {
			file_browser = {
				theme = "ivy",
				hijack_netrw = true,
			},
		},
	})

	telescope.load_extension("projects")
	telescope.load_extension("file_history")
end

M["telescope-file-history.nvim"] = function()
	require("file_history").setup({
		backup_dir = vim.fn.stdpath("data") .. "/file-history-git/",
		git_log_format = "%h %s (%cr) <%an>",
		git_log_opts = "--follow --all --full-history --date=short",
	})
end


M['nvim-neoclip.lua'] = function()
    require('neoclip').setup({
        enable_persistent_history = true,
        continuous_sync = true,
        initial_mode = 'normal',
        on_paste = {
            set_reg = false,
            move_to_front = true,
            close_telescope = true,
        },
    })
end

-- ================================================================================
-- FILE EXPLORER
-- ================================================================================

M["nvim-tree.lua"] = function()
	require("nvim-tree").setup({
		sort = {
			sorter = "case_sensitive",
		},
		view = {
            adaptive_size = true,
		},
		renderer = {
			root_folder_label = ":~:s?$?/..?",
			indent_width = 4,
			indent_markers = {
				enable = true,
				inline_arrows = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "│",
					bottom = "─",
					none = " ",
				},
			},
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
			symlink_destination = true,
		},
		disable_netrw = true,
		git = {
			enable = true,
			ignore = true,
			show_on_dirs = true,
			show_on_open_dirs = true,
			timeout = 400,
		},
		filesystem_watchers = {
			enable = true,
			debounce_delay = 50,
			ignore_dirs = {},
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
				restrict_above_cwd = false,
			},
			expand_all = {
				max_folder_discovery = 300,
				exclude = {},
			},
			file_popup = {
				open_win_config = {
					col = 1,
					row = 1,
					relative = "cursor",
					border = "shadow",
					style = "minimal",
				},
			},
			open_file = {
				quit_on_open = true,
				resize_window = true,
				window_picker = {
					enable = true,
					picker = "default",
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "nofile", "terminal", "help" },
					},
				},
			},
			remove_file = {
				close_window = true,
			},
		},
		trash = {
			cmd = "gio trash",
		},
		live_filter = {
			prefix = "[FILTER]: ",
			always_show_folders = true,
		},
		tab = {
			sync = {
				open = false,
				close = false,
				ignore = {},
			},
		},
		notify = {
			threshold = vim.log.levels.INFO,
		},
		ui = {
			confirm = {
				remove = false,
				trash = false,
			},
		},
	})
end

-- ================================================================================
-- TERMINAL & EXTERNAL TOOLS
-- ================================================================================

M["toggleterm.nvim"] = function()
	require("toggleterm").setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		open_mapping = [[<c-\>]],
		on_create = function()
			vim.opt.foldcolumn = "0"
			vim.opt.signcolumn = "no"
		end,
		hide_numbers = true,
		shade_filetypes = {},
		autochdir = false,
		highlights = {
			Normal = {
				link = "Normal",
			},
			NormalFloat = {
				link = "NormalFloat",
			},
			FloatBorder = {
				link = "FloatBorder",
			},
		},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,
		persist_size = true,
		persist_mode = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		auto_scroll = true,
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
		winbar = {
			enabled = false,
			name_formatter = function(term)
				return term.name
			end,
		},
	})

	function _G.set_terminal_keymaps()
		local opts = { buffer = 0 }
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	end

	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

	local Terminal = require("toggleterm.terminal").Terminal
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
            border = "double",
        },
        on_open = function(term)
            vim.cmd("startinsert!")
            -- vim.api.nvim_buf_del_keymap(term.bufnr, "t", "<esc>")
            vim.api.nvim_buf_del_keymap(term.bufnr, "t", "jk")

            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<esc>", { noremap = false })
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_close = function(term)
            -- Восстанавливаем маппинги при закрытии (если нужно)
        end,
    })

	function _LAZYGIT_TOGGLE()
		lazygit:toggle()
	end

	local node = Terminal:new({ cmd = "node", hidden = true })
	function _NODE_TOGGLE()
		node:toggle()
	end

	local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
	function _NCDU_TOGGLE()
		ncdu:toggle()
	end

	local htop = Terminal:new({ cmd = "htop", hidden = true })
	function _HTOP_TOGGLE()
		htop:toggle()
	end

	local python = Terminal:new({ cmd = "python", hidden = true })
	function _PYTHON_TOGGLE()
		python:toggle()
	end
end

-- ================================================================================
-- FORMATTING & CODE QUALITY
-- ================================================================================

M["conform.nvim"] = function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "ruff_format", stop_after_first = false },
			ipynb = { "isort", "ruff_format", stop_after_first = false },
			rust = { "rustfmt" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			svelte = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			graphql = { "prettierd", "prettier", stop_after_first = true },
			java = { "google-java-format" },
			kotlin = { "ktlint" },
			ruby = { "standardrb" },
			go = { "goimports", "gofmt" },
			php = { "php_cs_fixer" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			cmake = { "cmakelang" },
			scala = { "scalafmt" },
			sql = { "sqlformat" },
			sh = { "shfmt" },
			fish = { "fish_indent" },
			nix = { "alejandra" },
			terraform = { "terraform_fmt" },
			hcl = { "terragrunt_hclfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		format_after_save = {
			lsp_fallback = true,
		},
		log_level = vim.log.levels.ERROR,
		notify_on_error = true,
		formatters = {
			injected = { options = { ignore_errors = true } },
			-- black = {
				-- prepend_args = { "--fast" },
			-- },
			-- isort = {
				-- prepend_args = { "--profile", "black" },
			-- },
		},
	})
end

-- ================================================================================
-- SYNTAX HIGHLIGHTING & PARSING
-- ================================================================================

M["nvim-treesitter"] = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"dockerfile",
			"go",
			"html",
			"java",
			"javascript",
			"json",
			"kotlin",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"ruby",
			"rust",
			"scala",
			"sql",
			"toml",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
			"zig",
		},
		auto_install = true,
		sync_install = false,
		ignore_install = {},
		modules = {},
		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		fold = { enable = true },
	})
end

M["nvim-treesitter-textobjects"] = function()
	require("nvim-treesitter.configs").setup({
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
				},
				selection_modes = {
					["@parameter.outer"] = "v",
					["@function.outer"] = "V",
					["@class.outer"] = "<c-v>",
				},
				include_surrounding_whitespace = true,
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = { query = "@class.outer", desc = "Next class start" },
					["]o"] = "@loop.*",
					["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
					["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
				goto_next = {
					["]d"] = "@conditional.outer",
				},
				goto_previous = {
					["[d"] = "@conditional.outer",
				},
			},
			lsp_interop = {
				enable = true,
				border = "none",
				floating_preview_opts = {},
				peek_definition_code = {
					["<leader>df"] = "@function.outer",
					["<leader>dF"] = "@class.outer",
				},
			},
		},
	})
end

-- ================================================================================
-- KEYBOARD & HOTKEYS
-- ================================================================================

M["which-key.nvim"] = function()
	require("which-key").setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				motions = false,
				text_objects = false,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		show_help = true,
		show_keys = true,
		disable = {
			buftypes = {},
			filetypes = {},
		},
	})
end

-- ================================================================================
-- GIT SIGNS
-- ================================================================================

M["gitsigns.nvim"] = function()
	require("gitsigns").setup({
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged_enable = true,
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil,
		max_file_length = 40000,
		preview_config = {
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			-- Actions
			map("n", "<leader>hs", gitsigns.stage_hunk)
			map("n", "<leader>hr", gitsigns.reset_hunk)
			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			map("n", "<leader>hS", gitsigns.stage_buffer)
			map("n", "<leader>hu", gitsigns.undo_stage_hunk)
			map("n", "<leader>hR", gitsigns.reset_buffer)
			map("n", "<leader>hp", gitsigns.preview_hunk)
			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end)
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
			map("n", "<leader>hd", gitsigns.diffthis)
			map("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end)
			map("n", "<leader>td", gitsigns.toggle_deleted)

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
	})
end

-- ================================================================================
-- NOTIFICATIONS & UI
-- ================================================================================

M["nvim-notify"] = function()
	require("notify").setup({
		background_colour = "NotifyBackground",
		fps = 30,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = 2,
		minimum_width = 50,
		render = "compact",
		stages = "fade_in_slide_out",
		time_formats = {
			notification = "%T",
			notification_history = "%FT%T",
		},
		timeout = 5000,
		top_down = true,
	})

	vim.notify = require("notify")
end

M["noice.nvim"] = function()
	require("noice").setup({
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = false,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
	})
end

-- ================================================================================
-- THEMES & COLORSCHEMES
-- ================================================================================

M["themery.nvim"] = function()
	require("themery").setup({
		themes = {
			{
				name = "Gruvbox dark",
				colorscheme = "gruvbox",
				before = [[
     -- All this block will be executed before apply "set colorscheme gruvbox"
     vim.opt.background = "dark"
    ]],
			},
			{
				name = "Gruvbox light",
				colorscheme = "gruvbox",
				before = [[
     vim.opt.background = "light"
    ]],
				after = [[-- Same as before, but after if you need it]],
			},
			{
				name = "Tokyonight Night",
				colorscheme = "tokyonight-night",
			},
			{
				name = "Tokyonight Storm",
				colorscheme = "tokyonight-storm",
			},
			{
				name = "Tokyonight Day",
				colorscheme = "tokyonight-day",
			},
			{
				name = "Catppuccin Latte",
				colorscheme = "catppuccin-latte",
			},
			{
				name = "Catppuccin Frappe",
				colorscheme = "catppuccin-frappe",
			},
			{
				name = "Catppuccin Macchiato",
				colorscheme = "catppuccin-macchiato",
			},
			{
				name = "Catppuccin Mocha",
				colorscheme = "catppuccin-mocha",
			},
			{
				name = "Kanagawa Wave",
				colorscheme = "kanagawa-wave",
			},
			{
				name = "Kanagawa Dragon",
				colorscheme = "kanagawa-dragon",
			},
			{
				name = "Kanagawa Lotus",
				colorscheme = "kanagawa-lotus",
			},
			{
				name = "Rose Pine",
				colorscheme = "rose-pine",
			},
			{
				name = "Rose Pine Main",
				colorscheme = "rose-pine-main",
			},
			{
				name = "Rose Pine Moon",
				colorscheme = "rose-pine-moon",
			},
			{
				name = "Rose Pine Dawn",
				colorscheme = "rose-pine-dawn",
			},
			{
				name = "Nightfox",
				colorscheme = "nightfox",
			},
			{
				name = "Dayfox",
				colorscheme = "dayfox",
			},
			{
				name = "Dawnfox",
				colorscheme = "dawnfox",
			},
			{
				name = "Duskfox",
				colorscheme = "duskfox",
			},
			{
				name = "Nordfox",
				colorscheme = "nordfox",
			},
			{
				name = "Terafox",
				colorscheme = "terafox",
			},
			{
				name = "Carbonfox",
				colorscheme = "carbonfox",
			},
			{
				name = "Dracula",
				colorscheme = "dracula",
			},
		},
		livePreview = true,
	})
end

-- ================================================================================
-- RETURN THE MODULE
-- ================================================================================

return M
