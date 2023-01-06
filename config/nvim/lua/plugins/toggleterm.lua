-- [[ toggleterm ]]
-- A neovim lua plugin to help easily manage multiple terminal windows
-- https://github.com/akinsho/toggleterm.nvim

require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  insert_mapping = true, -- Open mapping also works in insert mode
  on_open = function()
    vim.cmd("wa") -- Save all buffers when opening a terminal
  end,
  direction = "float",
})
