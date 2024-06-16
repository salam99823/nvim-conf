---@type LazyPluginSpec[]
return {
  {
    "folke/neodev.nvim",
    ft = "lua",
    opts = {
      library = {
        enabled = true,
        runtime = true,
        types = true,
        plugins = true,
      },
      setup_jsonls = true,
      lspconfig = true,
    },
  },
}
