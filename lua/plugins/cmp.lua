local utils = require("utils")

---@type LazyPluginSpec[]
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
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = "json",
        config = function(_, opts)
          require("cmp-npm").setup(opts)
        end,
      },
    },
    ---@param opts cmp.ConfigSchema
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
      for _, source in ipairs(sources) do
        table.insert(opts.sources, source)
      end
      return opts
    end,
    ---@param self LazyPlugin
    ---@param opts cmp.ConfigSchema
    config = function(self, opts)
      utils
        .super(self, function(plugin)
          return not vim.is_callable(plugin.config)
        end)
        .config(self, opts)
    end,
  },
}
