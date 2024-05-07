--[[
  File: treesitter.lua
  Description: Configuration of tree-sitter
  See: https://github.com/tree-sitter/tree-sitter
]]
require("nvim-treesitter.configs").setup({
  modules = {},

  auto_install = true,
	ignore_install = {},
  autotag = {
		enable = true,
	},

	-- Needed parsers
	ensure_installed = {
		"lua",
    "css",
    "scss",
    "html",
		"typescript",
		"javascript",
    "vim",
    "vimdoc",
		"python",
		"rust",
    "c",
    "cpp",
    "cmake",
    "git_config",
    "gitcommit",
    "gitignore",
    "json",
    "toml",
    "yaml",
    "xml",
	},

	-- Install all parsers synchronously
	sync_install = false,

	-- Highlight
	highlight = {
		-- Enabling highlight for all files
		enable = true,
		disable = {},
	},

	indent = {
		-- Disabling indentation for all files
		enable = true,
		disable = {},
	},
})
