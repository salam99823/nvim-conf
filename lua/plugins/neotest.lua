---@module "lazy"
---@module "neotest"

---@type LazySpec[]
return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = function(_, opts)
      opts = opts or {}
      opts.adapters = opts.adapters or {}
      opts.adapters["neotest-python"] = {
          runner = "pytest",
      }
    end,
  }
}
