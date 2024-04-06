return {
  -- -------------------------------------------------
  --               FLASH.NVIM                        |
  -- -------------------------------------------------
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
  -- stylua: ignore
  keys = function()
    return {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    }
  end,
  },
}
