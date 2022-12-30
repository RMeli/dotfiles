-- [[ toggleterm ]]
-- A neovim lua plugin to help easily manage multiple terminal windows
-- https://github.com/akinsho/toggleterm.nvim

require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    direction = "float",
})

