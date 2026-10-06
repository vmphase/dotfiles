return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local function lsp_names()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if #clients == 0 then
          return ""
        end
        local names = {}
        for _, c in ipairs(clients) do
          table.insert(names, c.name)
        end
        return "LSP: " .. table.concat(names, ", ")
      end

      local function not_terminal()
        return vim.bo.buftype ~= "terminal"
      end

      local icons = LazyVim.config.icons.diagnostics

      opts.sections.lualine_c = {
        {
          "filetype",
          icon_only = true,
          separator = "",
          padding = { left = 1, right = 0 },
          cond = not_terminal,
        },
        { LazyVim.lualine.pretty_path(), separator = "", cond = not_terminal },
        { "%=", separator = "" },
        {
          "diagnostics",
          separator = "",
          always_visible = true,
          sections = { "error", "warn", "info" },
          symbols = {
            error = icons.Error,
            warn = icons.Warn,
            info = icons.Info,
          },
        },
      }

      opts.sections.lualine_x = {
        lsp_names,
        "encoding",
      }

      opts.sections.lualine_y = {}
    end,
  },
}
