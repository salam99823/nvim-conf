local telescope = require("telescope")
telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
		lazy = {
			show_icon = true,
			mappings = {
				open_in_browser = "<C-o>",
				open_in_file_browser = "<M-b>",
				open_in_find_files = "<C-f>",
				open_in_live_grep = "<C-g>",
				open_in_terminal = "<C-t>",
				open_plugins_picker = "<C-b>",
				open_lazy_root_find_files = "<C-r>f",
				open_lazy_root_live_grep = "<C-r>g",
				change_cwd_to_plugin = "<C-c>d",
			},
			actions_opts = {
				open_in_browser = {
					auto_close = false,
				},
				change_cwd_to_plugin = {
					auto_close = false,
				},
			},
			terminal_opts = {
				relative = "editor",
				style = "minimal",
				border = "rounded",
				title = "Telescope lazy",
				title_pos = "center",
				width = 0.5,
				height = 0.5,
			},
		},
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
	pickers = {
		oldfiles = {
			cwd_only = true,
		},
	},
})

telescope.load_extension("ui-select")
telescope.load_extension("lazy")
telescope.load_extension("dap")
telescope.load_extension("fzy_native")
telescope.load_extension("luasnip")
