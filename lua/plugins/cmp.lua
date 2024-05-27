return {
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
    opts = function(_, opts)
      local cmp = require("cmp")
      local tabout = require("tabout")
      local compare = require("cmp.config.compare")

      return {
        completion = {
          completeopt = "menu,menuone",
        },
        window = {
          documentation = false,
        },
        view = {
          entries = { follow_cursor = true },
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Set `select` to `false` to only confirm explicitly selected items.
          ["<C-n>"] = function(fallback)
            if cmp.visible() then
              cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })(fallback)
            else
              cmp.mapping.complete()(fallback)
            end
          end,
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- source: https://www.reddit.com/r/neovim/comments/que9ey/tab_for_completion_and_snippets/
          ["<Tab>"] = cmp.mapping(function()
            if vim.snippet.active({ direction = 1 }) then
              vim.schedule(function()
                vim.snippet.jump(1)
              end)
            elseif vim.api.nvim_get_mode().mode == "i" then
              tabout.tabout()
            else
              vim.cmd("<Tab>")
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }),
        -- sort the cmp menu options based on a number of metrics in this order of priority
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
  --               CMDLINE COMPLETION                |
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
