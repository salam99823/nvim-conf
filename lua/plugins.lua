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
                    require "plug.lspconf"
                end
            },

            {
                "rcarriga/nvim-dap-ui", -- DAP
                dependencies = {
                    "mfussenegger/nvim-dap",
                    "nvim-neotest/nvim-nio",
                    {
                        "LiadOz/nvim-dap-repl-highlights",
                        dependencies = {
                            "nvim-treesitter/nvim-treesitter",
                        },
                    },
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
            },
        },
        config = function()
            require "plug.mason"
        end
    },

    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            require "plug.cmp"
        end
    },

    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require "plug.trouble"
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
        },
        config = function()
            require "plug.telescope"
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require "plug.neotree"
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require "plug.treesitter"
        end
    }
}
