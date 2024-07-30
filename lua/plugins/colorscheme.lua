return {
  -- -------------------------------------------------
  --               COLORSCHEME                       |
  -- -------------------------------------------------

  {
    "mcchrish/zenbones.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    -- init = function()
    --   -- Config for zenbones colorschemes
    --   vim.g.zenbones = { transparent_background = true }
    --   vim.g.forestbones = { transparent_background = true, darken_comments = 80 }
    --   vim.g.neobones = { transparent_background = true }
    --   vim.g.duckbones = { transparent_background = true }
    -- end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "retrobox",
    },
  },
}
