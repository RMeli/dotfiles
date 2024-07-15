-- [[ which-key.nvim ]]
-- Create key bindings that stick
-- https://github.com/folke/which-key.nvim

local ok, wk = REQUIRE_PLUGIN("which-key")
if not ok then
  return
end

wk.setup({
  preset="modern",
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
})
