return {
  -- -------------------------------------------------
  --               LSPCONFIG                         |
  -- -------------------------------------------------

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- inlay_hints = true,
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
  --               DIAGFLOW                          |
  --                                                 |
  --               Better placement for              |
  --               LSP Diagnostic Text               |
  -- -------------------------------------------------

  -- {
  --   "dgagn/diagflow.nvim",
  --   event = "LspAttach",
  --   opts = {
  --     format = function(diagnostic)
  --       return "[LSP] " .. diagnostic.message
  --     end,
  --   },
  -- },
}
