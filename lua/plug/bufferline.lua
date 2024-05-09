--[[
    File: bufferline.lua
    Description: Buferline plugin configuration
    See: https://github.com/akinsho/bufferline.nvim
]]
local bufferline = require("bufferline")
bufferline.setup({
	options = {
		mode = "tabs",
		diagnostics = "nvim_lsp",
		color_icons = true,
		offsets = {
			{
				filetype = "neo-tree",
				text_align = "left",
				separator = true,
			},
		},

		separator_style = "slope", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
	},
})
