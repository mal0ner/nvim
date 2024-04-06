return {}
-- return {
--   {
--     "mg979/vim-visual-multi",
--   },
-- {
--   "nvim-neorg/neorg",
--   build = ":Neorg sync-parsers",
--   dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
--   config = function()
--     require("neorg").setup({
--       load = {
--         ["core.defaults"] = {}, -- Loads default behaviour
--         ["core.concealer"] = { config = { icons = { code_block = { conceal = true } } } }, -- Adds pretty icons to your documents
--         ["core.dirman"] = { -- Manages Neorg workspaces
--           config = {
--             workspaces = {
--               school = "~/notes/school",
--               wiki = "~/notes/wiki",
--             },
--             default_workspace = "school",
--           },
--         },
--         ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Neorg]" } },
--         ["core.integrations.telescope"] = {},
--         ["core.keybinds"] = {
--           config = {
--             hook = function(keybinds)
--               keybinds.remap_event("norg", "n", "<leader>nc", "core.dirman.new.note")
--               keybinds.remap_event("norg", "n", "<leader>ns", "core.integrations.telescope.find_linkable")
--               keybinds.remap_event("norg", "n", "<leader>nil", "core.integrations.telescope.insert_link")
--               -- promotion / demotion keybinds
--               keybinds.remap_event("norg", "n", "<leader>nhd", "core.promo.demote")
--               keybinds.remap_event("norg", "v", "<leader>nhd", "core.promo.demote_range")
--               keybinds.remap_event("norg", "n", "<leader>nhp", "core.promo.promote")
--               keybinds.remap_event("norg", "v", "<leader>nhd", "core.promo.promote_range")
--             end,
--           },
--         },
--       },
--     })
--   end,
--   cmd = "Neorg",
--   ft = "norg",
-- },
-- {
--   "SmiteshP/nvim-navbuddy",
--   opts = {
--     lsp = {
--       auto_attach = true,
--     },
--   },
-- },
--
--   {
--     "m4xshen/hardtime.nvim",
--     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
--     opts = {},
--   },
-- }
--
--
-- return {
--   {
--     "stevearc/oil.nvim",
--     dependencies = { "nvim-tree/nvim-web-devicons" },
--     lazy = false,
--     config = function()
--       require("oil").setup({
--         columns = {
--           "permissions",
--           "size",
--           "mtime",
--           "icon",
--         },
--         buf_options = { buflisted = true, bufhidden = "hide" },
--         cleanup_dlay_ms = false,
--         view_options = {
--           sort = {
--             { "type", "asc" },
--             { "name", "asc" },
--           },
--         },
--       })
--     end,
--     keys = {
--       {
--         "<leader>e",
--         "<cmd>Oil<cr>",
--         desc = "Oil (file explorer)",
--       },
--     },
--   },
-- }

-- return {
--   {
--     "chentoast/marks.nvim",
--     opts = {
--       default_mappings = true,
--       bookmark_0 = {
--         sign = "⚑",
--         virt_text = "hello world",
--         -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--         -- defaults to false.
--         annotate = false,
--       },
--     },
--     -- keymaps
--     -- mx: set mark x
--     -- m,: set next available mark
--     -- m;: toggle next available mark
--     -- dmx: delete mark x
--     -- dm-: delete marks on curr line
--     -- dm<space>: delete marks in buffer
--     -- m]: next mark
--     -- m[: prev mark
--     -- m:: preview mark
--   },
-- }
--
-- return {
--   "nvim-lualine/lualine.nvim",
--   event = "VeryLazy",
--   opts = function()
--     local icons = require("lazyvim.config").icons
--     local Util = require("lazyvim.util")
--
--     local modeLetter = function()
--       local letter = vim.fn.mode()
--       return string.upper(letter)
--     end
--
--     return {
--       options = {
--         theme = "auto",
--         globalstatus = true,
--         disabled_filetypes = { statusline = { "dashboard", "alpha" } },
--       },
--       sections = {
--         lualine_a = { modeLetter },
--         lualine_b = { "branch" },
--         lualine_c = {
--           {
--             "diagnostics",
--             symbols = {
--               error = icons.diagnostics.Error,
--               warn = icons.diagnostics.Warn,
--               info = icons.diagnostics.Info,
--               hint = icons.diagnostics.Hint,
--             },
--           },
--           { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--           { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
--           -- stylua: ignore
--           {
--             function() return require("nvim-navic").get_location() end,
--             cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
--           },
--         },
--         lualine_x = {
--           -- stylua: ignore
--           {
--             function() return require("noice").api.status.command.get() end,
--             cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
--             color = Util.fg("Statement"),
--           },
--           -- stylua: ignore
--           {
--             function() return require("noice").api.status.mode.get() end,
--             cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
--             color = Util.fg("Constant"),
--           },
--           -- stylua: ignore
--           {
--             function() return "  " .. require("dap").status() end,
--             cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
--             color = Util.fg("Debug"),
--           },
--           { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
--           {
--             "diff",
--             symbols = {
--               added = icons.git.added,
--               modified = icons.git.modified,
--               removed = icons.git.removed,
--             },
--           },
--         },
--       },
--       extensions = { "neo-tree", "lazy" },
--     }
--   end,
-- }
--
-- return {
--   "folke/which-key.nvim",
--   opts = {
--     defaults = {
--       mode = { "n", "v" },
--       ["<leader>n"] = { name = "+neorg" },
--     },
--   },
-- }

-----------------------------------------------------
--                NOICE NVIM / UI
-----------------------------------------------------
--[[ {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        -- cmdline to bottom, classic style
        view = "cmdline",
        format = {
          cmdline = { pattern = "^:", icon = " ", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "search  ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "search back  ", lang = "regex" },
        },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = false,
        },
        hover = {
          enabled = false,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  } ]]

-- -------------------------------------------------
--               NVIM NOTIFY                       |
-- -------------------------------------------------
--[[ {
    "nvim-notify",
    opts = {
      background_colour = "#000000",
    },
    config = function(opts)
      require("notify").setup(opts)
    end,
  } ]]
-- IMAGE.NVIM
--
-- -- ADD THIS TO INIT.LUA TO MAKE SURE IT CAN FIND THE MAGICK LUAROCK INSTALL PATH
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
-- return {
--   {
--     "3rd/image.nvim",
--     opts = {
--       backend = "kitty",
--       integrations = {
--         markdown = {
--           enabled = true,
--           clear_in_insert_mode = false,
--           download_remote_images = true,
--           only_render_image_at_cursor = false,
--           filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
--         },
--         neorg = {
--           enabled = true,
--           clear_in_insert_mode = false,
--           download_remote_images = true,
--           only_render_image_at_cursor = false,
--           filetypes = { "norg" },
--         },
--       },
--       max_width = nil,
--       max_height = nil,
--       max_width_window_percentage = nil,
--       max_height_window_percentage = 50,
--       window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
--       window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
--       editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
--       tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
--       hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
--     },
--   },
-- }
--

-- -- -------------------------------------------------
-- --               TREESJ                            |
-- -- -------------------------------------------------
-- {
--   -- This plugin allows for easy expansion / collapse
--   -- of treesitter text objects
--   "Wansmer/treesj",
--   keys = { "<space>m" },
--   dependencies = { "nvim-treesitter/nvim-treesitter" },
--   config = function()
--     require("treesj").setup({--[[ your config ]]
--     })
--   end,
-- },

-- return {
-- {
--   "folke/noice.nvim",
--   event = "VeryLazy",
--   opts = {
--     lsp = {
--       -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--       override = {
--         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--         ["vim.lsp.util.stylize_markdown"] = true,
--         ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
--       },
--     },
--     -- you can enable a preset for easier configuration
--     presets = {
--       bottom_search = true, -- use a classic bottom cmdline for search
--       command_palette = true, -- position the cmdline and popupmenu together
--       long_message_to_split = true, -- long messages will be sent to a split
--       inc_rename = false, -- enables an input dialog for inc-rename.nvim
--       lsp_doc_border = true, -- add a border to hover docs and signature help
--     },
--   },
--   dependencies = {
--     "MunifTanjim/nui.nvim",
--   },
-- },
-- }
--

-- This gets rid of standard input wrappers via dressing, I should just disable it instead.
-- return {
-- "stevearc/dressing.nvim",
-- lazy = true,
-- init = function()
--   ---@diagnostic disable-next-line: duplicate-set-field
--   vim.ui.select = function(...)
--     require("lazy").load({ plugins = { "dressing.nvim" } })
--     return vim.ui.select(...)
--   end
--   -- I DONT LIKE THE INPUT ONE ITS JANK!
--   -- ---@diagnostic disable-next-line: duplicate-set-field
--   -- vim.ui.input = function(...)
--   --   require("lazy").load({ plugins = { "dressing.nvim" } })
--   --   return vim.ui.input(...)
--   -- end
-- end,
-- }
--

-- INCLINE.NVIM FROM REDDIT POST: https://www.reddit.com/r/neovim/comments/1bsi5xf/tip_make_the_pmenu_follow_the_cursor_in_nvimcmp/
-- AND CONFIG: https://github.com/mcauley-penney/nvim/tree/984c384af9ea5a2779d415cd0b801f4ac9046fea
-- local function get_hl_hex(opts, ns_id)
--   opts, ns_id = opts or {}, ns_id or 0
--   assert(opts.name or opts.id, "Error: must have hl group name or ID!")
--   opts.link = true
--
--   local hl = vim.api.nvim_get_hl(ns_id, opts)
--
--   return {
--     fg = hl.fg and ("#%06x"):format(hl.fg),
--     bg = hl.bg and ("#%06x"):format(hl.bg),
--   }
-- end
--
-- return {
--   "b0o/incline.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   opts = {
--     window = {
--       padding = 0,
--       margin = {
--         horizontal = 2,
--         vertical = 2,
--       },
--       placement = {
--         horizontal = "center",
--         vertical = "bottom",
--       },
--     },
--     render = function(props)
--       local float_hl = get_hl_hex({ name = "NormalFloat" })
--       local norm_hl = get_hl_hex({ name = "Normal" })
--
--       local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
--       if filename == "" then
--         filename = "[No Name]"
--       end
--       local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
--
--       return {
--         { "", guibg = norm_hl.bg, guifg = float_hl.bg },
--         ft_icon and { ft_icon, guifg = ft_color } or "",
--         ft_icon and " ",
--         filename,
--         { "", guibg = norm_hl.bg, guifg = float_hl.bg },
--       }
--     end,
--   },
-- }

-- return {
--   "akinsho/bufferline.nvim",
--   opts = {
--     options = {
--       buffer_close_icon = "",
--     },
--   },
-- }
