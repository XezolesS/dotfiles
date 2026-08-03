return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        themable = false,

        numbers = "none",
        indicator = {
          style = "underline",
        },

        buffer_close_icon = "󰅖",
        modified_icon = "● ",
        close_icon = " ",
        left_trunc_marker = " ",
        right_trunc_marker = " ",

        diagnostics = "nvim_lsp",

        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,

        separator_style = "thin",

        always_show_bufferline = true,
        auto_toggle_bufferline = true,
      },
    },
  },
}
