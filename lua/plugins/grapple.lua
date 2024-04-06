return {
  -- -------------------------------------------------
  --               GRAPPLE (HARPOON)                 |
  -- -------------------------------------------------
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git", -- also try out "git_branch"
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
      { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
      { "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
      -- { "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
      -- { "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
      { "<leader>1", "<cmd>Grapple select index=1<cr>" },
      { "<leader>2", "<cmd>Grapple select index=2<cr>" },
      { "<leader>3", "<cmd>Grapple select index=3<cr>" },
      { "<leader>4", "<cmd>Grapple select index=4<cr>" },
    },
  },
}
