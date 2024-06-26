return {}
-- -------------------------------------------------
--               UNUSED COLORS                     |
-- -------------------------------------------------
-- {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     require("rose-pine").setup({
--       disable_background = true,
--       disable_float_background = true,
--     })
--   end,
-- },
-- {
--   "neanias/everforest-nvim",
--   config = function()
--     require("everforest").setup({
--       background = "hard",
--       transparent_background_level = 3,
--     })
--   end,
-- },
-- {
--   "ramojus/mellifluous.nvim",
--   config = function()
--     require("mellifluous").setup({})
--   end,
-- },
-- {
--   "blazkowolf/gruber-darker.nvim",
--   opts = {
--     bold = false,
--     italic = {
--       strings = false,
--       comments = false,
--     },
--   },
-- },
-- {
--   "catppuccin/nvim",
--   lazy = false,
--   name = "catppuccin",
--   opts = {
--     flavour = "macchiato",
--     transparent_background = true,
--   },
--   config = function(_, opts)
--     require("catppuccin").setup(opts)
--   end,
-- },
-- {
--   "mcchrish/zenbones.nvim",
--   dependencies = {
--     "rktjmp/lush.nvim",
--   },
--   init = function()
--     -- Config for zenbones colorschemes
--     vim.g.zenbones = { transparent_background = true }
--     vim.g.forestbones = { transparent_background = true, darken_comments = 80 }
--     vim.g.neobones = { transparent_background = true }
--     vim.g.duckbones = { transparent_background = true }
--   end,
-- },
-- {
--   "LazyVim/LazyVim",
--   opts = {
--     colorscheme = "aquarium",
--   },
-- },
--
--
-- MAY 2024
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
