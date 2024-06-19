---@module "lazy"
---@module "cmp"

local utils = require("utils")

---@type LazySpec[]
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp",
      "chrisgrieser/cmp-nerdfont",
      "hrsh7th/cmp-emoji",
      {
        "hrsh7th/cmp-nvim-lua",
        ft = "lua",
      },
      {
        "vrslev/cmp-pypi",
        dependencies = "nvim-lua/plenary.nvim",
        ft = "toml",
      },
      {
        "David-Kunz/cmp-npm",
        dependencies = "nvim-lua/plenary.nvim",
        ft = "json",
        config = function(_, opts)
          require("cmp-npm").setup(opts)
        end,
      },
    },
    ---@param _ LazyPlugin
    ---@param opts conform.setupOpts
    ---@return conform.setupOpts
    opts = function(_, opts)
      local sources = utils.sources({
        "nvim_lsp_signature_help",
        "pypi",
        "npm",
        "nvim_lua",
        {
          "emoji",
          group_index = 2,
        },
        {
          "nerdfont",
          group_index = 2,
        },
      })
      opts.sources = vim.list_extend(opts.sources, sources)
      return opts
    end,
  },
}
