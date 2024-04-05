return {
  -- -------------------------------------------------
  --              COMMENT.NVIM                       |
  -- -------------------------------------------------
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
}
