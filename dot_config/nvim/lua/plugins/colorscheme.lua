return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
  {
    "AndresYague/dracula.nvim",
    version = "*",
    lazy = false,
    priority = 1000,
    opts = {
      style = "default",
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "dark",
      },
      sidebars = {
        "qf",
        "help",
      },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true,

      -- override colors
      on_colors = function() end,

      -- override highlights
      on_highlights = function(hl, c)
        -- which-key.nvim
        hl.WhichKeyNormal = {
          bg = c.dark_bg,
        }
        hl.WhichKeyBorder = {
          bg = c.dark_bg,
          fg = c.border,
        }
        hl.WhichKeyTitle = {
          bg = c.dark_bg,
          fg = c.border_header,
        }
      end,

      use_background = true,

      cache = true,

      prefer_undercurl = true,

      plugins = {
        all = package.loaded.lazy == nil,
        auto = true,
      },
    },
  },
  {
    "catppuccin/nvim",
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
}
