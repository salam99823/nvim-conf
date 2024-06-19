---@module "lazy"
---@module "neo-tree"

---@type LazySpec[]
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    ---@param _ LazyPlugin
    ---@param opts table
    ---@return table
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts, {
        close_if_last_window = true,
        filesystem = { filtered_items = { visible = true } },
      })
      return opts
    end,
  },
}
