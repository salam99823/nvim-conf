--[[
  File: neotree.lua
  Description: Configuration of neo-tree
  See: https://github.com/nvim-neo-tree/neo-tree.nvim
]]
return {
	close_if_last_window = true,
	default_component_configs = {
		name = {
			trailing_slash = true,
			use_git_status_colors = true,
		},
		indent = {
			with_markers = true,
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
}
