---@module "lazy"
---@module "nvim-treesitter"

---@type LazySpec[]
return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@param _ LazyPlugin
    ---@param opts table
    ---@return table
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "css",
      })
      return opts
    end,
  },
}
