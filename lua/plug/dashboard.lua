return {
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
	},
}
