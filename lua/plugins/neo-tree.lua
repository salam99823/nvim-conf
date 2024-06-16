---@type LazyPluginSpec[]
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    ---@param _ LazyPlugin
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts, {
        close_if_last_window = true,
        filesystem = { filtered_items = { visible = true } },
      })
      return opts
    end,
  },
}
