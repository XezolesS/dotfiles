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
      show = true,
      show_in_active_only = true,
      set_highlights = true,
      handle = {
        text = " ",
        color = colors.selection,
        hide_if_all_visible = true,
      },
      marks = {
        Cursor = {
          color = colors.bright_blue,
        },
        Search = {
          color = colors.orange,
        },
        Error = {
          color = colors.error,
        },
        Warn = {
          color = colors.warning,
        },
        Info = {
          color = colors.info,
        },
        Hint = {
          color = colors.hint,
        },
        Misc = {
          color = colors.bright_cyan,
        },
        GitAdd = {
          color = colors.git.add,
        },
        GitChanges = {
          color = colors.git.change,
        },
        GitDelete = {
          color = colors.git.delete,
        },
      },
      excluded_filetypes = {
        "snacks_input",
        "snacks_picker_input",
        "snacks_picker_list",

        "codecompanion",
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        handle = true,
        search = true,
        ale = false,
      },
    },
  },
}
