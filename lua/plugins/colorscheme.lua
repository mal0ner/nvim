return {
  -- -------------------------------------------------
  --               COLORSCHEME                       |
  -- -------------------------------------------------
  -- {
  --   "olivercederborg/poimandres.nvim",
  --   config = function(_)
  --     vim.cmd.colorscheme("poimandres")
  --     -- fix for weird border outlines on cmp-windows
  --     -- source: https://www.reddit.com/r/neovim/comments/18faftd/cmp_border_background_is_changed_all_of_a_sudden/
  --     vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
  --     vim.cmd("hi NormalFloat guibg=Normal")
  --
  --     -- for telescope styling
  --     vim.cmd("hi TelescopePromptPrefix guifg=#89ddff")
  --   end,
  -- },
  -- {
  --   "projekt0n/github-nvim-theme",
  --   config = function(_)
  --     vim.cmd.colorscheme("github_dark_default")
  --     -- fix for weird border outlines on cmp-windows
  --     -- source: https://www.reddit.com/r/neovim/comments/18faftd/cmp_border_background_is_changed_all_of_a_sudden/
  --     vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
  --     vim.cmd("hi NormalFloat guibg=Normal")
  --
  --     -- for telescope styling
  --     vim.cmd("hi TelescopePromptPrefix guifg=#89ddff")
  --   end,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "retrobox",
    },
  },
}
