local indent_scope = require("mini.indentscope")

return {
  {
    "echasnovski/mini.indentscope",
    event = "VeryLazy",
    opts = {
      draw = {
        delay = 0,
        animation = indent_scope.gen_animation.none(),
      },
      symbol = "╎",
    },
  },
  {
    "echasnovski/mini.tabline",
    event = "UIEnter",
    version = false,
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      show_icons = false,
    },
  },
}
