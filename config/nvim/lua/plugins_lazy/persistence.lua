-- [[ persistence.nvim ]]
-- Simple session management for Neovim
-- https://github.com/folke/persistence.nvim

return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
  keys = {
    { "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], desc = "Load Session" },
    { "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], desc = "Load Last Session" },
    { "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], "Do Not Save Current Session" },
  },
}
