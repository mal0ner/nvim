-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- ADD DELAY TO NVIM CMP POPUP WINDOW APPEARING
-- from: https://github.com/hrsh7th/nvim-cmp/issues/715
-- local timer = nil

-- vim.api.nvim_create_autocmd({ "TextChangedI", "CmdLineChanged" }, {
--   pattern = "*",
--   callback = function()
--     if timer then
--       vim.loop.timer_stop(timer)
--       timer = nil
--     end
--
--     timer = vim.loop.new_timer()
--     timer:start(
--       200,
--       0,
--       vim.schedule_wrap(function()
--         require("cmp").complete({ reason = require("cmp").ContextReason.Auto })
--       end)
--     )
--   end,
-- })
