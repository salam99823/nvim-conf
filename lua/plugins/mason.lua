---@module "lazy"
---@module "mason"

---@type LazySpec[]
return {
  {
    "williamboman/mason.nvim",
    ---@param _ LazyPlugin
    ---@param opts MasonSettings
    ---@return MasonSettings
    opts = function(_, opts)
      opts = opts or {}
      opts.ui = opts.ui or {}
      opts.ui.icons = {
        package_installed = "󰄳",
        package_pending = "󰇚",
        package_uninstalled = "󰝦",
      }
      return opts
    end,
  },
}
