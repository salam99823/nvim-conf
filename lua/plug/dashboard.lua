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
		},
		shortcut = {
			{
				desc = " Update",
				group = "@property",
				action = "Lazy update",
				key = "u",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = "Telescope app",
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
		project = {
			enable = true,
			limit = 8,
			icon = "your icon",
			label = "",
			action = "Telescope find_files cwd=",
		},
	},
})
