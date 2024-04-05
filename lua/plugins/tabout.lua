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
      after = { "luasnip" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
    },
  },
}
