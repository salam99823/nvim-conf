---@type LazyPluginSpec[]
return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@param _ LazyPlugin
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "css",
        "rst",
      })
      return opts
    end,
  },
}
