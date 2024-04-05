-- resize windows
vim.keymap.set("n", "<M-Up>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<M-Down>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<CR>")

-- better C-d and C-u, from ThePrimeagen baby
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
local f = function(lhs, rhs, opts) end

-- cycle through windows with TAB in normal mode, thanks reddit
vim.keymap.set("n", "<TAB>", "<C-w>w")

-- best remap ever? yes, it is - replace a line in vis-mode
-- by sending the deleted stuff to the void
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace with yanked text and send to void" })
-- delete and send to purgatory
vim.keymap.set({ "n", "x" }, "<leader>d", [["_d]], { desc = "Delete to the void" })

-- Query Stack Overflow
vim.keymap.set("n", "<leader>os", function()
  local query = vim.fn.input("Query: ")
  vim.cmd("silent !tmux split-window -h so " .. query)
end, { desc = "Query StackOverflow (tmux)" })

-- find snippets
vim.keymap.set("n", "<leader>fs", function()
  require("luasnip.loaders").edit_snippet_files()
end, { desc = "Find Snippets" })

-- Telescope file_browser
vim.keymap.set("n", "<leader>.", "<cmd>Telescope file_browser<CR>", { desc = "Telescope file browser" })

-- Diagnostics
local enabled = false
local function toggle_diagnostics()
  enabled = not enabled
  if enabled then
    vim.diagnostic.enable()
    local util = require("lazyvim.util")
    util.info("Enabled diagnostics", { title = "Diagnostics" })
  else
    vim.diagnostic.disable()
    local util = require("lazyvim.util")
    util.warn("Disabled diagnostics", { title = "Diagnostics" })
  end
end
vim.keymap.set("n", "<leader>ud", toggle_diagnostics, { desc = "Toggle Diagnostics" })
