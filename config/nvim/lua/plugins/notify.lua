-- [[ nvim-notify ]]
-- A fancy, configurable, notification manager for NeoVim
-- https://github.com/rcarriga/nvim-notify

return {
  "rcarriga/nvim-notify",
  lazy = false,
  priority = 99,
  opts = {
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "",
      WARN = "",
    },
    timeout = 2500,
  },
  init = function()
    vim.notify = require("notify")
  end,
}
