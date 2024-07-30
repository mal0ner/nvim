-- set up notes prefix
-- local wk = require("which-key")
-- wk.register({
--   { "", group = "notes" },
-- })
return {
  -- -------------------------------------------------
  --               OBSIDIAN                          |
  -- -------------------------------------------------
  "epwalsh/obsidian.nvim",
  version = "*",
  -- lazy = true,
  -- event = "BufReadPre " .. vim.fn.expand("~" .. "/notes/**.md"),
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = function(_, opts)
    -- workspaces
    opts.workspaces = {
      {
        name = "home",
        path = "~/Documents/notes/",
      },
    }

    -- dailies
    opts.daily_notes = {
      folder = "05-daily",
    }
    -- telescope picker
    opts.picker = {
      name = "telescope.nvim",
    }

    -- note creation naming rules
    opts.note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end

    -- link following
    opts.follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end
  end,
  keys = {
    {
      "<leader>nf",
      "<cmd>ObsidianQuickSwitch<cr>",
      desc = "Note [F]ind",
    },
    {
      "<leader>ns",
      "<cmd>ObsidianSearch<cr>",
      desc = "Note [S]earch",
    },
    {
      "<leader>nc",
      "<cmd>ObsidianNew<cr>",
      desc = "Note [C]reate",
    },
  },
}
