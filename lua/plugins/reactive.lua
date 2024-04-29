-- Reactive.nvim:
--    Highlight cursor and cursorline depending on mode.
--
-- gh: https://github.com/rasulomaroff/reactive.nvim
return {
  {
    "rasulomaroff/reactive.nvim",
    opts = {
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true,
      },
    },
  },
}
