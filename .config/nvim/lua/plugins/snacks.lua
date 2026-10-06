return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
      picker = {
        sources = {
          explorer = {
            hidden = true,
        ignored = true,
            layout = {
              preset = "sidebar",
              preview = false,
              hidden = { "input" },
            },
          },
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
      dashboard = {
        preset = {
          keys = {
            { key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "keys", gap = 1 },
        },
      },
    },
  },
}
