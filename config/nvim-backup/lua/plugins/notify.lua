-- [[ nvim-notify ]]
-- A fancy, configurable, notification manager for NeoVim
-- https://github.com/rcarriga/nvim-notify

local ok, notify = REQUIRE_PLUGIN("notify")
if not ok then
  return
end

notify.setup({
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "",
    WARN = "",
  },
  timeout = 2500,
})

vim.notify = notify
