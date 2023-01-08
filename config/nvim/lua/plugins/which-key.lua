-- [[ which-key.nvim ]]
-- Create key bindings that stick
-- https://github.com/folke/which-key.nvim

require("which-key").setup({
  window = {
    border = "single",
    position = "bottom",
  },
  icons = {
    breadcrumb = "",
    separator = "ﭠ",
    group = "",
  },
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
})
