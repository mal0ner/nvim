return {
  -- -------------------------------------------------
  --               TREESITTER                        |
  -- -------------------------------------------------
  -- Treesitter auto install parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c_sharp" })
        vim.list_extend(opts.ensure_installed, { "rust" })
        vim.list_extend(opts.ensure_installed, { "typescript" })
        vim.list_extend(opts.ensure_installed, { "astro" })
        vim.list_extend(opts.ensure_installed, { "ocaml" })
      end
      opts.incremental_selection.keymaps.init_selection = "<CR>"
      opts.incremental_selection.keymaps.node_incremental = "<CR>"
      opts.incremental_selection.keymaps.node_decremental = "<BS>"
    end,
  },
}
