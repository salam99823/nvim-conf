---@type LazyPluginSpec[]
return {
  {
    "williamboman/mason-lspconfig.nvim",
    ---@param _ LazyPlugin
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "tsserver",
        "svelte",
        "emmet_ls",
        "cssls",
        "lua_ls",
        "pylsp",
        "ruff",
        "rust_analyzer",
        "clangd",
        "cmake",
        "lemminx",
        "biome",
        "taplo",
        "hydra_lsp",
        "vimls",
      })
      return opts
    end,
  },
}
