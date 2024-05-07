--[[
    File: formatter.lua
    Description: Formatter plugin configuration
    See: http://github.com/mhartington/formatter.nvim
]]
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		python = {},
		rust = require("formatter.filetypes.rust"),
		["*"] = require("formatter.filetypes.any"),
	},
})