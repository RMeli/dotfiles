return {
  -- github-nvim-theme
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priotiry = 1000,
    opts = { style = "github_dark" },
    config = function()
      require("github-theme").setup()
    end,
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },

  -- lunarvim
  {
    "lunarvim/colorschemes",
    lazy = true,
  },
}
