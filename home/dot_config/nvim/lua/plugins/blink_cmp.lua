local function get_mini_icon(ctx)
  if ctx.source_name == "Path" then
    local is_unknown_type =
      vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
    local mini_icon, mini_hl, _ =
      require("mini.icons").get(is_unknown_type and "os" or ctx.item.data.type, is_unknown_type and "" or ctx.label)
    if mini_icon then
      return mini_icon, mini_hl
    end
  end
  local mini_icon, mini_hl, _ = require("mini.icons").get("lsp", ctx.kind)
  return mini_icon, mini_hl
end

return {
  {
    "saghen/blink.cmp",
    dependencies = {
      -- required
      "rafamadriz/friendly-snippets",

      -- optionals
      "folke/noice.nvim",
    },
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
        -- ["<Tab>"] = { "accept" },
      },

      cmdline = {
        keymap = { preset = "inherit" },
        sources = { "buffer", "cmdline" },
        completion = {
          trigger = {
            show_on_blocked_trigger_characters = {},
            show_on_x_blocked_trigger_characters = {},
          },
          list = {
            selection = {
              preselect = true,
              auto_insert = false,
            },
          },
          menu = { auto_show = true },
          ghost_text = { enabled = true },
        },
      },

      completion = {
        keyword = { range = "full" },
        accept = { auto_brackets = { enabled = false } },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = {
          enabled = true,
          min_width = 15,
          max_height = 10,
          border = "rounded",
          winblend = 0,
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          scrolloff = 2,
          scrollbar = true,
          auto_show = true,
          auto_show_delay_ms = 0,
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local kind_icon, _ = get_mini_icon(ctx)
                  return kind_icon
                end,
                highlight = function(ctx)
                  local _, kind_hl = get_mini_icon(ctx)
                  return kind_hl
                end,
              },
              kind = {
                highlight = function(ctx)
                  local _, kind_hl = get_mini_icon(ctx)
                  return kind_hl
                end,
              },
            },
          },
        },
        documentation = {
          window = { border = "rounded" },
        },
      },

      signature = {
        window = { border = "rounded" },
      },
    },
  },
}
