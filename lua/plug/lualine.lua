--[[
    File: lualine.lua
    Description: Lualine plugin configuration
    See: https://github.com/nvim-lualine/lualine.nvim
]]
local active_lsp = {
	function()
		local buftype = Api.nvim_buf_get_option(0, "filetype")
		local clients = Lsp.get_active_clients()
		if next(clients) == nil then
			return ""
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and Fn.index(filetypes, buftype) ~= -1 then
				return client.name
			end
		end
		return ""
	end,
}
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "monokai-pro",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "diagnostics", "filename" },
		lualine_c = { active_lsp },
		lualine_x = { "fileformat", "encoding", "filetype" },
		lualine_y = { "diff", "branch" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "lazy", "trouble", "nvim-tree", "mason", "nvim-dap-ui" },
})
