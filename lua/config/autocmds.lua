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

-- when a split is opened, automatically turn on the winbar so that each one is
-- labelled with its filename.
vim.api.nvim_create_autocmd({ "WinEnter", "WinClosed" }, {
  pattern = "*",
  callback = function()
    local split_count = #vim.api.nvim_tabpage_list_wins(0)
    if split_count > 1 then
      vim.opt.winbar = "%t"
    else
      vim.opt.winbar = ""
    end
  end,
})
