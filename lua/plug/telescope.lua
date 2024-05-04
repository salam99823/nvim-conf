--[[
    File: telescope.lua
    Description: Telescope plugin configuration
    See: https://github.com/nvim-telescope/telescope.nvim
]]

local telescope = require("telescope")
telescope.setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        },
    },
    pickers = {
        oldfiles = {
            cwd_only = true,
        },
    },
})

telescope.load_extension("ui-select")
