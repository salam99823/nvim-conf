---@module "lazy"
---@module "mason-lspconfig"

---@type LazySpec[]
return {
  {
    "williamboman/mason-lspconfig.nvim",
    ---@param _ LazyPlugin
    ---@param opts MasonLspconfigSettings
    ---@return MasonLspconfigSettings
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "tsserver",
        "svelte",
        "emmet_ls",
        "cssls",
        "lua_ls",
        "pylsp",
        "lemminx",
        "biome",
        "taplo",
        "hydra_lsp",
      })
      return opts
    end,
  },
}
