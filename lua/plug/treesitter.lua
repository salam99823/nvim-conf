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

	sync_install = false,

	highlight = {
		enable = true,
		disable = {},
	},

	indent = {
		enable = true,
		disable = {},
	},
})
