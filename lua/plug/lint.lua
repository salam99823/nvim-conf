--[[
    File: formatter.lua
    Description: Formatter plugin configuration
    See: http://github.com/mfussenegger/nvim-lint
]]
require("lint").linters_by_ft = {
	markdown = { "markuplint" },
	python = { "ruff", "mypy" },
}
