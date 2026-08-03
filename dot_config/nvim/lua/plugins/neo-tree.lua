return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
      -- required
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-tree/nvim-web-devicons",
    },
  },
}
