-- [[ persistence.nvim ]]
-- Simple session management for Neovim
-- https://github.com/folke/persistence.nvim

return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    options = {
      "buffers",
      "curdir",
      "tabpages",
      "winsize",
      "help",
    },
  },
}
