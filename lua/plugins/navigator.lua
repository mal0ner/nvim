return {
  -- -------------------------------------------------
  --               VIM-TMUX-NAVIGATOR                |
  -- -------------------------------------------------
  {
    "alexghergh/nvim-tmux-navigation",
    opts = {
      disable_when_zoomed = true,
      -- keybindings = {
      --   left = "<C-h>",
      --   down = "<C-j>",
      --   up = "<C-k>",
      --   right = "<C-l>",
      --   last_active = "<C-\\>",
      --   next = "<C-Space>",
      -- },
    },
    keys = {
      { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", desc = "Navigate Left (tmux aware)" },
      { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Navigate Right (tmux aware)" },
      { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", desc = "Navigate Down (tmux aware)" },
      { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", desc = "Navigate Up (tmux aware)" },
    },
  },
}
