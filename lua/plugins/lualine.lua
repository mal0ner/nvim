local Util = require("lazyvim.util")
local icons = require("lazyvim.config").icons

local modes = {
  ["n"] = "NO",
  ["no"] = "OP",
  ["nov"] = "OC",
  ["noV"] = "OL",
  ["no\x16"] = "OB",
  ["\x16"] = "VB",
  ["niI"] = "IN",
  ["niR"] = "RE",
  ["niV"] = "RV",
  ["nt"] = "NT",
  ["ntT"] = "TM",
  ["v"] = "VI",
  ["vs"] = "VI",
  ["V"] = "VL",
  ["Vs"] = "VL",
  ["\x16s"] = "VB",
  ["s"] = "SE",
  ["S"] = "SL",
  ["\x13"] = "SB",
  ["i"] = "IN",
  ["ic"] = "IC",
  ["ix"] = "IX",
  ["R"] = "RE",
  ["Rc"] = "RC",
  ["Rx"] = "RX",
  ["Rv"] = "RV",
  ["Rvc"] = "RC",
  ["Rvx"] = "RX",
  ["c"] = "CO",
  ["cv"] = "CV",
  ["r"] = "PR",
  ["rm"] = "PM",
  ["r?"] = "P?",
  ["!"] = "SH",
  ["t"] = "TE",
}

local mode_letters = function()
  local letters = modes[vim.fn.mode()]
  return string.upper(string.sub(letters, 1, 2))
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { mode_letters },
        lualine_c = {
          Util.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          -- { "filename" },
        },
        lualine_z = {},
      },
    },
  },
}
