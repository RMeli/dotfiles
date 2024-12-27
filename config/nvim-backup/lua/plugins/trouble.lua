-- [[trouble.nvim ]]
-- A pretty diagnostics, references, telescope results, quickfix and location list
-- https://github.com/folke/trouble.nvim

local ok, trouble = REQUIRE_PLUGIN("trouble")
if not ok then
  return
end

trouble.setup({
  position = "bottom",
  height = 10, -- height when position is top or bottom
  width = 50, -- width when position is left or right
  icons = true,
  use_diagnostic_signs = true, -- use the signs defined in your lsp client
})

local wk_ok, wk = REQUIRE_PLUGIN("which-key")
if wk_ok then
  wk.add({
    { "<leader>l", group = "LSP" },
    { "<leader>lx", "<cmd>TroubleToggle<cr>", desc = "Open Troubles" },
  })
end
