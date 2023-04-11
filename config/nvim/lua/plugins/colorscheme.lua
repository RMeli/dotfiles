return {
  -- github-nvim-theme
  {
    "projekt0n/github-nvim-theme",
    version = "v0.0.7",
    lazy = false,
    priority = 100,
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
