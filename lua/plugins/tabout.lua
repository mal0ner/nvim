return {
  -- -------------------------------------------------
  --               TABOUT                            |
  -- -------------------------------------------------
  {
    "abecodes/tabout.nvim",
    lazy = true,
    event = "InsertEnter",
    opts = {
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "<", close = ">" },
      },
      exclude = {}, -- tabout will ignore these filetypes
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
