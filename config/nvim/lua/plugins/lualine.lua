-- [[ lualine ]]
-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- https://github.com/nvim-lualine/lualine.nvim

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        always_divide_middle = true,
    },
})
