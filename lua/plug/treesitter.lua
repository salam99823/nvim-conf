--[[
  File: treesitter.lua
  Description: Configuration of tree-sitter
  See: https://github.com/tree-sitter/tree-sitter
]]
return {
	auto_install = true,
	ignore_install = {},
	ensure_installed = {
		"lua",
		"css",
		"scss",
		"html",
    "svelte",
		"typescript",
		"javascript",
		"vim",
		"vimdoc",
    "pymanifest",
		"python",
		"rust",
		"c",
		"cpp",
		"cmake",
		"git_config",
		"gitcommit",
		"gitignore",
    "markdown",
    "rst",
		"json",
		"toml",
		"yaml",
		"xml",
	},
	sync_install = false,
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
}
