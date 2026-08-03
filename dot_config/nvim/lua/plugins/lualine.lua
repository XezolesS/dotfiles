local colors, opts = require("dracula.colors").setup({ transform = true, style = vim.g.colors_name })

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      -- optionals
      "franco-ruggeri/codecompanion-lualine.nvim",
    },
    opts = {
      options = {
        theme = "dracula",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          -- Command status
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = colors.pink },
          },

          -- Mode status
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = colors.bright_red },
          },

          -- Search status
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = colors.orange },
          },

          "encoding",
          "fileformat",
          "filetype",

          -- Code Companion status
          {
            "codecompanion",
            icon = "󰚩",
            spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
            done_symbol = "✓",
          },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
}
