-- [[ nvim-autopairs ]]
-- autopairs for neovim written by lua
-- https://github.com/windwp/nvim-autopairs

local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" },
  enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in the same line
  ignored_next_char = "[%w%.]", -- Don't add pairs if the next char is alphanumeric
  -- treesitter
  check_ts = true,
  ts_config = {
    lua = { "string" }, -- it will not add a pair on that treesitter node
  },
})

-- autopairs/cmp integration
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local ok, cmp = pcall(require, "cmp")
if not ok then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
