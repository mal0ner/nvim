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
        find_files = make_picker_opts("[Find files] "),
        live_grep = make_picker_opts("[Live grep] "),
        buffers = make_picker_opts("[Buffers] "),
        keymaps = make_picker_opts("[Keymaps] "),
        oldfiles = make_picker_opts("[Oldfiles] "),
        git_files = make_picker_opts("[Git files] "),
      },
    },
  },
}
