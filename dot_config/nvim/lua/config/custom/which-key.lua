local which_key = require("which-key")

-- for olimorris/codecompanion.nvim
-- <leader>A - stands for 'A'I
if package.loaded["codecompanion"] then
  which_key.add({
    { "<leader>A", group = "CodeCompanion" },
    { "<leader>Aa", "<cmd>CodeCompanionAction<cr>", desc = "Action" },
    { "<leader>Ac", "<cmd>CodeCompanionChat<cr>", desc = "Chat" },
    { "<leader>Ai", "<cmd>CodeCompanion<cr>", desc = "Inline" },

    { "<leader>A", group = "CodeCompanion", mode = "v" },
    { "<leader>Ai", "<cmd>'<,'>CodeCompanion<cr>", desc = "Inline", mode = "v" },
  })
end
