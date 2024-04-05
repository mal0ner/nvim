return {
  {
    "olivercederborg/poimandres.nvim",
    config = function(_)
      vim.cmd.colorscheme("poimandres")
      -- fix for weird border outlines on cmp-windows
      -- source: https://www.reddit.com/r/neovim/comments/18faftd/cmp_border_background_is_changed_all_of_a_sudden/
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
      vim.cmd("hi NormalFloat guibg=Normal")
    end,
  },
}
