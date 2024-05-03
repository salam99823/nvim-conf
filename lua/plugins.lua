require "utils/aliases"

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require "plug/lualine"
        end
    },

    {
        "tanvirtin/monokai.nvim",
        config = function()
            require "plug/monokai"
        end
    },
    
    {
        "loctvl842/monokai-pro.nvim",
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require "plug/monokai-pro"
        end
    },
}
