--[[
  File: neotree.lua
  Description: Configuration of neo-tree
  See: https://github.com/nvim-neo-tree/neo-tree.nvim
]]
local neotree = require("neo-tree")

neotree.setup({
	close_if_last_window = true,
	default_component_configs = {
		name = {
			trailing_slash = true,
			use_git_status_colors = true,
		},
--[[
    git_status = {
			symbols = {
				-- Change type
				added = "✚",
				deleted = "✖",
				modified = "",
				renamed = "󰁕",
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},
]]
		indent = {
			with_markers = true,
			indent_marker = "▏",
			last_indent_marker = "▏",
			indent_size = 2,
		},
	},
	window = {
		width = 30,
		mappings = {
			["l"] = "open",
			["h"] = "close_node",
			["A"] = "git_add_all",
			["ga"] = "git_add_file",
			["gu"] = "git_unstage_file",
			["gr"] = "git_revert_file",
			["gc"] = "git_commit",
			["gp"] = "git_push",
			["gg"] = "git_commit_and_push",
		},
	},
	filesystem = {
		follow_current_file = {
			enabled = true,
		},
		filtered_items = {
			visible = true,
		},
	},
--[[
  source_selector = {
		winbar = false, -- toggle to show selector on winbar
		statusline = false, -- toggle to show selector on statusline
		show_scrolled_off_parent_node = false, -- boolean
		sources = { -- table
			{
				source = "filesystem", -- string
				display_name = " 󰉓 Files ", -- string | nil
			},
			{
				source = "buffers", -- string
				display_name = " 󰈚 Buffers ", -- string | nil
			},
			{
				source = "git_status", -- string
				display_name = " 󰊢 Git ", -- string | nil
			},
		},
		content_layout = "start", -- string
		tabs_layout = "equal", -- string
		truncation_character = "…", -- string
		tabs_min_width = nil, -- int | nil
		tabs_max_width = nil, -- int | nil
		padding = 0, -- int | { left: int, right: int }
		separator = { left = "▏", right = "▕" }, -- string | { left: string, right: string, override: string | nil }
		separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
		show_separator_on_edge = false, -- boolean
		highlight_tab = "NeoTreeTabInactive", -- string
		highlight_tab_active = "NeoTreeTabActive", -- string
		highlight_background = "NeoTreeTabInactive", -- string
		highlight_separator = "NeoTreeTabSeparatorInactive", -- string
		highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
	},
]]
})
