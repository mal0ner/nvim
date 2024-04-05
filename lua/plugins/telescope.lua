local function make_picker_opts(prefix)
  return { prompt_title = "", prompt_prefix = prefix }
end

return {
  -- -------------------------------------------------
  --               TELESCOPE                         |
  -- -------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      -- set default picker theme to ivy for all pickers
      defaults = require("telescope.themes").get_ivy({
        layout_config = { height = 0.30 },
        results_title = "",
      }),
      pickers = {
        find_files = make_picker_opts("[find files] "),
        live_grep = make_picker_opts("[live grep] "),
        buffers = make_picker_opts("[buffers] "),
        keymaps = make_picker_opts("[keymaps] "),
        oldfiles = make_picker_opts("[oldfiles] "),
      },
    },
  },
}
