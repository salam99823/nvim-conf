--[[
    File: formatter.lua
    Description: Formatter plugin configuration
    See: http://github.com/mfussenegger/nvim-lint
]]
local lint = require("lint")

local linters = {
	markdown = { "markdownlint" },
	python = { "ruff", "mypy" },
}

lint.linters_by_ft = linters

Api.nvim_create_user_command("TryLint", function(args)
	require("lint").try_lint(args.fargs[0])
end, {
	nargs = 1,
	complete = function(_, _, _)
		local filetype = Api.nvim_buf_get_option(0, "filetype")
		return linters[filetype]
	end,
	desc = "",
})
