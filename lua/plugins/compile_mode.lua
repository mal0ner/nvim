return {
  -- -------------------------------------------------
  --               COMPILE-MODE                      |
  -- -------------------------------------------------
  "ej-shafran/compile-mode.nvim",
  branch = "nightly",
  cmd = "Recompile",
  -- or a specific version:
  -- tag = "v2.0.0"
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "m00qek/baleia.nvim", tag = "v1.3.0" },
  },
  opts = {
    -- you can disable colors by uncommenting this line
    -- no_baleia_support = true,
    default_command = "",
    -- prompt for compile_command if vim.g.compile_command is not set
    recompile_no_fail = true,
  },
  keys = {
    {
      "<leader>cb",
      "<cmd>10Recompile<cr>",
      desc = "Code Build (compile_mode) (s for some reason)",
    },
  },
}
