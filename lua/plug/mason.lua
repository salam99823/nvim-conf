--[[
    File: mason.lua
    Description: Mason plugin configuration
    See: https://github.com/williamboman/mason.nvim
]]
local mason = require("mason")

mason.setup({
	ui = {
		border = "rounded",
	},
})
