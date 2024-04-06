return {
  -- -------------------------------------------------
  --               INCLINE                           |
  -- -------------------------------------------------
  "b0o/incline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    window = {
      padding = 0,
      margin = { horizontal = 0 },
    },
    render = function(props)
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      if filename == "" then
        filename = "[No Name]"
      end
      local ft_icon, ft_color = devicons.get_icon_color(filename)
      local modified = vim.bo[props.buf].modified
      return {
        -- ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
        " ",
        modified and filename .. " [+]" or filename,
        " ",
        guibg = "#303340",
      }
    end,
  },
  config = function(_, opts)
    require("incline").setup(opts)
  end,
}
