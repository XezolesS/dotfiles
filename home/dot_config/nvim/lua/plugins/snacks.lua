return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    depndencies = {
      -- optionals
      "nvim-mini/mini.icons",
    },
    opts = {
      -- enabled
      explorer = { enabled = true },
      image = { enabled = true },
      notifier = { enabled = true, timeout = 3000, style = "fancy", refresh = 10 },
      picker = { enabled = true },

      -- disabled
      scope = { enabled = false }, -- using mini.indentscope instead
      statuscolumn = { enabled = false }, -- using lualine instead
    },
    keys = {},
  },
}
