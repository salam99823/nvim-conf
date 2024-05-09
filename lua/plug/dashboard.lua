--[[
    File: dashboard.lua
    Description: Dashboard plugin configuration
    See: http://github.com/nvimdev/dashboard-nvim
]]
local dashboard = require("dashboard")

dashboard.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
			concat = nil,
			append = nil,
		},
		shortcut = {
			{
				icon = " ",
				desc = "Files",
				action = "Telescope find_files",
        group = "@method",
				key = "f",
			},

			{
				icon = " ",
				desc = "Update",
				action = "Lazy update",
        group = "@method",
				key = "u",
			},

			{
				icon = " ",
				desc = "Find plugin documentation",
				action = "Telescope lazy",
        group = "@method",
				key = "d",
			},
		},
		packages = {
			enable = true,
		}, -- show how many plugins neovim loaded
		project = {
			enable = true,
		},
		mru = {
			cwd_only = false,
		},
		footer = {}, -- footer
	},
	hide = {
		statusline = true,
		tabline = true,
	},
	preview = {
		command = "",
		file_path = nil,
		file_height = 0,
		file_width = 0,
	},
})
