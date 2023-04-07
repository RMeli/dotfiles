-- [[ nvim-autopairs ]]
-- autopairs for neovim written by lua
-- https://github.com/windwp/nvim-autopairs

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return {
  "windwp/nvim-autopairs",
  lazy = false,
  opts = {

    disable_filetype = { "TelescopePrompt", "alpha" },
    enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in the same line
    ignored_next_char = "[%w%.]", -- Don't add pairs if the next char is alphanumeric
    -- treesitter
    check_ts = true,
    ts_config = {
      lua = { "string" }, -- it will not add a pair on that treesitter node
    },
  },
}
