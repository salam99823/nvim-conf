require "utils/aliases"

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require "plug.lualine"
        end
    },

    {
        "tanvirtin/monokai.nvim",
        config = function()
            require "plug.monokai"
        end
    },

    {
        "loctvl842/monokai-pro.nvim",
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require "plug.monokai-pro"
        end
    },

    {
        "williamboman/mason.nvim",
        dependencies = {
            {
                "williamboman/mason-lspconfig.nvim", -- LSP
                dependencies = {
                    "neovim/nvim-lspconfig",
                },
                config = function()
                    require "plug.lspconfig"
                end
            },

            {
                "rcarriga/nvim-dap-ui", -- DAP
                dependencies = {
                    "mfussenegger/nvim-dap",
                    "nvim-neotest/nvim-nio",
                },
                config = function()
                    require "plug.dap"
                end
            },

            {
                "mfussenegger/nvim-lint", -- Linter
                config = function()
                    require "plug.lint"
                end
            },

            {
                "mhartington/formatter.nvim", -- Formatter
                config = function()
                    require "plug.formatter"
                end
            }
        },
        config = function()
            require "plug.mason"
        end
    },

    {
        ""
    },
}
