--[[
    File: monokai-pro.lua
    Description: Monokai-pro color scheme configuration
    See: https://github.com/loctvl842/monokai-pro.nvim
]]
return {
	transparent_background = false,
	terminal_colors = true,
	devicons = true,
	day_night = {
		enable = false,
	},
	inc_search = "background",
	background_clear = {
		"float_win",
		"toggleterm",
		"telescope",
		"neo-tree",
		"bufferline",
	},
	plugins = {
		indent_blankline = {
			context_highlight = "classic",
			context_start_underline = false,
		},
	},
}
