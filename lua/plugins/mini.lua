local indent_scope = require("mini.indentscope")

return {
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 0,
        animation = indent_scope.gen_animation.none(),
      },
    },
  },
  {
    "echasnovski/mini.tabline",
    event = "UIEnter",
    version = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      show_icons = true,
    },
  },
}
