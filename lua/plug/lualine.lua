--[[
    File: lualine.lua
    Description: Lualine plugin configuration
    See: https://github.com/nvim-lualine/lualine.nvim
]]
local function active_lsp()
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
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
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
		lualine_b = {
			{
				"diagnostics",
				on_click = function()
					Cmd([[TroubleToggle]])
				end,
				always_visible = true,
			},
			"filename",
		},
		lualine_c = {
			{
				active_lsp,
				on_click = function()
					Cmd([[LspInfo]])
				end,
			},
		},
		lualine_y = {
			{
				"diff",
				on_click = function()
					Cmd([[Telescope git_status]])
				end,
			},
			{
				"branch",
				on_click = function()
					Cmd([[Telescope git_branches]])
				end,
			},
		},
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				use_mode_colors = true,
        filetype_names = {
          toggleterm = "zsh",
        },
			},
		},
		lualine_b = {
			{
				"tabs",
				mode = 1,
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			"datetime",
		},
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {
		"lazy",
		"trouble",
		"mason",
		"nvim-dap-ui",
		"neo-tree",
	},
})
