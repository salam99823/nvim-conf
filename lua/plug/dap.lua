--[[
    File: dap.lua
    Description: DAP plugin configuration
    See: https://github.com/mfussenegger/nvim-dap
]]
require("utils.aliases")

require("mason-nvim-dap").setup({
    ensure_installed = { "python", "delve" },
    handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
    },
})