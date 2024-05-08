--[[
    File: ibl.lua
    Description: IBL plugin configuration
    See: http://github.com/lukas-reineke/indent-blankline.nvim
]]
local ibl = require("ibl")

ibl.setup({
	enabled = false,
	indent = {},
	whitespace = {
		highlight = { "Whitespace", "NonText" },
	},
})
