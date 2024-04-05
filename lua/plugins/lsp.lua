return {
  -- -------------------------------------------------
  --               LSPCONFIG                         |
  -- -------------------------------------------------

  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   {
    --     "SmiteshP/nvim-navbuddy",
    --     dependencies = {
    --       "SmiteshP/nvim-navic",
    --       "MunifTanjim/nui.nvim",
    --     },
    --   },
    -- },
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        omnisharp = {},
        pyright = {},
        ruff_lsp = {},
        emmet_language_server = {},
        bashls = {},
        cssls = {},
        tailwindcss = {},
        astro = {},
        ocamllsp = {},
      },
    },
  },

  -- -------------------------------------------------
  --               NULL-LS                           |
  -- -------------------------------------------------

  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     table.insert(opts.sources, nls.builtins.formatting.black)
  --     table.insert(opts.sources, nls.builtins.formatting.csharpier)
  --     table.insert(opts.sources, nls.builtins.formatting.rustfmt)
  --     table.insert(opts.sources, nls.builtins.formatting.prettierd)
  --     table.insert(opts.sources, nls.builtins.formatting.ocamlformat)
  --     -- prettierd does not work with astro currently
  --     table.insert(
  --       opts.sources,
  --       nls.builtins.formatting.prettier.with({
  --         filetypes = { "astro" },
  --       })
  --     )
  --   end,
  -- },

  -- -------------------------------------------------
  --               COMPLETION                        |
  -- -------------------------------------------------

  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local tabout = require("tabout")
      local compare = require("cmp.config.compare")

      -- Set same diagnostic window to cmp.config.window.bordered()
      -- vim.cmd(":set winhighlight=" .. cmp.config.window.bordered().winhighlight)

      return {
        -- setup = {
        --   preselect = cmp.PreselectMode.None,
        -- },
        -- preselect = cmp.PreselectMode.None,
        completion = {
          completeopt = "menu,menuone",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({ side_padding = 0 }),
          documentation = cmp.config.window.bordered({ side_padding = 0 }),
        },
        -- This makes the completion window follow the cursor, similar to the default behaviour
        -- in editors like vs-code. Looks a bit cleaner in my opinion.
        -- Found from: https://www.reddit.com/r/neovim/comments/1bsi5xf/tip_make_the_pmenu_follow_the_cursor_in_nvimcmp/
        view = {
          entries = { follow_cursor = true },
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          -- source: https://www.reddit.com/r/neovim/comments/que9ey/tab_for_completion_and_snippets/
          ["<Tab>"] = cmp.mapping(function()
            --[[ if luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.jumpable(1) then
              luasnip.jump(1) ]]
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif vim.api.nvim_get_mode().mode == "i" then
              tabout.tabout()
            else
              vim.cmd("<Tab>")
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "luasnip", priority = 40 },
          { name = "nvim_lsp" },
          -- { name = "neorg" },
          { name = "path" },
        }, { { name = "buffer", keyword_length = 5 } }),
        -- sort the cmp menu options based on a number of metrics
        -- in this order of priority
        -- source: https://www.reddit.com/r/neovim/comments/u3c3kw/how_do_you_sorting_cmp_completions_items/
        sorting = {
          comparators = {
            compare.locality,
            compare.recently_used,
            compare.score,
            compare.offset,
            compare.order,
          },
        },
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if item.kind == "Snippet" then
              item.kind = " " .. item.kind
            elseif icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end

            -- trim long function signatures in cmp menu to a maximum of 40
            -- chars to stop squishy docs
            -- source: https://www.youtube.com/watch?v=uDPZ2yJS6os
            local function trim(text)
              local max = 40 --> max characters
              if text and text:len() > max then
                text = text:sub(1, max) .. "⋅⋅⋅"
              end
              return text
            end

            item.abbr = trim(item.abbr)

            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
  -- -------------------------------------------------
  --               SNIPPETATION                      |
  -- -------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/" } })
      end,
    },
  },

  -- -------------------------------------------------
  --               DIAGFLOW                          |
  --                                                 |
  --               Better placement for              |
  --               LSP Diagnostic Text               |
  -- -------------------------------------------------

  {
    "dgagn/diagflow.nvim",
    event = "LspAttach",
    opts = {
      format = function(diagnostic)
        return "[LSP] " .. diagnostic.message
      end,
    },
  },
  -- -------------------------------------------------
  --               GARBAGE-DAY                       |
  --                                                 |
  --               Restart idle LSP Servers          |
  -- -------------------------------------------------
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- your options here
    },
  },
  -- -------------------------------------------------
  --               SNIPPETATION                      |
  -- -------------------------------------------------
  {
    "hrsh7th/cmp-cmdline",
    event = "CmdlineEnter",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      }
      cmp.setup.cmdline(":", {
        -- preselect = "None",
        completion = {
          completeopt = "noselect",
        },
        mapping = mapping,
        sources = cmp.config.sources({
          { name = "path", keyword_length = 3 },
        }, {
          {
            name = "cmdline",
            keyword_length = 3,
          },
        }),
        formatting = {
          expandable_indicator = true,
          fields = { "abbr" },
          format = function(_, item)
            item.abbr = " " .. item.abbr
            return item
          end,
        },
        experimental = {
          ghost_text = true,
        },
      })
    end,
  },
}
