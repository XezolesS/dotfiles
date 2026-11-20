local colors, opts = require("dracula.colors").setup({ transform = true, style = vim.g.colors_name })

return {
  {
    "petertriho/nvim-scrollbar",
    version = "*",
    dependencies = {
      -- optionals
      "kevinhwang91/nvim-hlslens",
      "lewis6991/gitsigns.nvim",
    },
    opts = {
      providers = {
        ale = false,
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        lsp_semantic_tokens = true,
        search = true,
      },
      scrollbar = {
        visibility = "active",
        thumb = {
          text = " ",
          highlight = { bg = colors.selection },
          hide_if_all_visible = true,
        },
      },
      minimap = {
        enabled = true,
      },
      marks = {
        Cursor = {
          highlight = { fg = colors.bright_blue },
        },
        Search = {
          highlight = { fg = colors.orange },
        },
        Error = {
          highlight = { fg = colors.error },
        },
        Warn = {
          highlight = { fg = colors.warning },
        },
        Info = {
          highlight = { fg = colors.info },
        },
        Hint = {
          highlight = { fg = colors.hint },
        },
        Misc = {
          highlight = { fg = colors.bright_cyan },
        },
        GitAdd = {
          text = { "┃" },
          priority = 7,
          highlight = { fg = colors.git.add },
        },
        GitChanges = {
          text = { "┃" },
          priority = 7,
          highlight = { fg = colors.git.change },
        },
        GitDelete = {
          text = { "▁" },
          priority = 7,
          highlight = { fg = colors.git.delete },
        },
      },
      exclude = {
        filetypes = {
          snacks_input = true,
          snacks_picker_input = true,
          snacks_picker_list = true,

          codecompanion = true,
        },
      },
    },
  },
}
