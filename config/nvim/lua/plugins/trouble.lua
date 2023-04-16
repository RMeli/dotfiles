-- [[trouble.nvim ]]
-- A pretty diagnostics, references, telescope results, quickfix and location list
-- https://github.com/folke/trouble.nvim

return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = {
    position = "bottom",
    height = 10, -- height when position is top or bottom
    width = 50, -- width when position is left or right
    icons = true,
    use_diagnostic_signs = true, -- use the signs defined in your lsp client
  },
}
