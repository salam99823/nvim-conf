--[[
    File: formatter.lua
    Description: Formatter plugin configuration
    See: http://github.com/mhartington/formatter.nvim
]]
return {
	filetype = {
		lua = {
      require("formatter.filetypes.lua").stylua,
    },
		python = {
			require("formatter.filetypes.python").ruff,
		},
		rust = require("formatter.filetypes.rust"),
		markdown = {
			require("formatter.filetypes.markdown").prettier,
			require("formatter.filetypes.markdown").prettierd,
		},
		svelte = require("formatter.filetypes.svelte"),
		css = require("formatter.filetypes.css"),
		toml = require("formatter.filetypes.toml"),
		pest = {
			{
				exe = "pestfmt",
				args = {
					"--stdin",
				},
				stdin = true,
			},
		},
		yaml = require("formatter.filetypes.yaml"),
		["*"] = require("formatter.filetypes.any"),
	},
}