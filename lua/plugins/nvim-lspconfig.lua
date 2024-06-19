---@module "lazy"
---@module "lspconfig"

---@type LazySpec[]
return {
  {
    "neovim/nvim-lspconfig",
    ---@param _ LazyPlugin
    ---@param opts lspconfig.settings
    ---@return lspconfig.settings
    opts = function(_, opts)
      opts = opts or {}
      opts.setup = opts.setup or {}
      opts.setup.rust_analyzer = function()
        return true
      end
      return opts
    end,
  },
}
