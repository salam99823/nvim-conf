--[[
    File: bindings.lua
    Description: Keybindings config
    See: https://github.com/salam99823/nvim-conf
]]
require("utils.aliases")
require("utils.binders")

Im("jk", "<esc>")
Nm("<leader>v", "<cmd>Neotree filesystem left toggle dir=./<cr>")
Nm("<leader><Tab>", "<cmd>Neotree buffers left toggle dir=./<cr>")