return {
  -- -------------------------------------------------
  --               NEOTREE                           |
  -- -------------------------------------------------
  {
    "neo-tree.nvim",
    opts = function(_, opts)
      opts.use_popups_for_input = false
      -- window
      opts.window.position = "right"
      opts.window.width = 40
    end,
  },
}
