-- [[ nvim-autopairs ]]
-- autopairs for neovim written by lua
-- https://github.com/windwp/nvim-autopairs

return {
  "windwp/nvim-autopairs",
  lazy = false,
  opts = {
    disable_filetype = { "TelescopePrompt", "spectre_panel", "alpha" },
    ignored_next_char = "[%w%.]", -- Don't add pairs if the next char is alphanumeric
    -- treesitter
    check_ts = true,
    ts_config = {
      lua = { "string" }, -- it will not add a pair on that treesitter node
    },
  },
}
