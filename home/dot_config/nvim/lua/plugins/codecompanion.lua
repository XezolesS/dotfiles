return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      -- optional
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "saghen/blink.cmp",
      "MeanderingProgrammer/render-markdown.nvim",
      "franco-ruggeri/codecompanion-spinner.nvim",
    },
    opts = {
      adapters = {
        http = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              env = {
                url = "http://localhost:11434",
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = "ollama",
            model = "qwen3-coder:latest",
          },
          roles = {
            llm = function(adapter)
              local llm_name = "󰚩 Clanker"
              llm_name = llm_name .. " | " .. adapter.formatted_name

              if adapter.model and adapter.model.name ~= "" then
                llm_name = llm_name .. " (" .. adapter.model.name .. ")"
              end

              return llm_name
            end,
            user = "󱁃 Yuzu Ice",
          },
          opts = {
            context_management = {
              enabled = true,
              editing = {
                trigger = 0.65,
              },
              compaction = {
                trigger = 0.85,
              },
            },
          },
          icons = {
            buffer_sync_all = "󰪴 ",
            buffer_sync_diff = " ",
            chat_context = " ",
            chat_fold = " ",
            tool_pending = "  ",
            tool_in_progress = "  ",
            tool_failure = "  ",
            tool_success = "  ",
          },
          fold_context = true,
          fold_reasoning = true,
          show_reasoning = false,
        },
        inline = {
          adapter = {
            name = "ollama",
            model = "qwen3-coder:latest",
          },
        },
        cmd = {
          adapter = {
            name = "ollama",
            model = "qwen3-coder:latest",
          },
        },
      },
      display = {
        chat = {
          window = {
            buflisted = false,
            sticky = true,
            pretab = false,

            layout = "float", -- float|vertical|horizontal|tab|buffer
            full_height = true, -- for vertical layout
            position = nil,

            width = 0.3,
            height = vim.o.lines - 5,
            border = "single",
            relative = "editor",

            col = vim.o.columns,
            row = 1,

            opts = {
              breakindent = true,
              linebreak = true,
              wrap = true,
            },
          },
          floating_window = {
            width = 0.3,
            height = vim.o.lines - 5,
            border = "single",
            relative = "editor",
            opts = {
              breakindent = true,
              linebreak = true,
              wrap = true,
            },
          },
          debug_window = {
            width = 10,
            height = 5,
          },

          auto_scroll = true,
          intro_message = "Welcome to CodeCompanion ✨! Press ? for options",

          separator = "─",
          show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin

          fold_context = false,
          show_context = true,

          fold_reasoning = true,
          show_reasoning = true,

          show_settings = true,
          show_token_count = true,
          show_tools_processing = true,
          start_in_insert_mode = false,
        },
      },
      opts = {
        log_level = "INFO",
      },
      extensions = {
        spinner = {},
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      ft = { "markdown", "codecompanion" },
    },
  },
}
