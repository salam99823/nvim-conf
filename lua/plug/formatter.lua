--[[
    File: formatter.lua
    Description: Formatter plugin configuration
    See: http://github.com/mhartington/formatter.nvim
]]
local util = require("formatter.util")
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		python = {
			{
				exe = "ruff",
				args = {
					"format",
					util.escape_path(util.get_current_buffer_file_path()),
				},
			},
		},
		rust = require("formatter.filetypes.rust"),
		["*"] = require("formatter.filetypes.any"),
	},
})