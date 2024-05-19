--[[
    File: formatter.lua
    Description: Formatter plugin configuration
    See: http://github.com/mhartington/formatter.nvim
]]
local util = require("formatter.util")
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").ruff,
		},
		rust = {
			exe = "rustfmt",
			args = {
				util.escape_path(util.get_current_buffer_file_path()),
			},
		},
		markdown = {
			{
				exe = "markdownlint",
				args = {
					util.escape_path(util.get_current_buffer_file_path()),
				},
			},
		},
		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		toml = {
			require("formatter.filetypes.toml").taplo,
		},
		pest = {
			{
				exe = "pestfmt",
				args = {
					"--stdin",
				},
				stdin = true,
			},
		},
		["*"] = require("formatter.filetypes.any"),
	},
})