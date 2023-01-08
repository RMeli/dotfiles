-- [[ lualine ]]
-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- https://github.com/nvim-lualine/lualine.nvim

local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

-- git diff
-- Updates only when buffer is saved
local diff = {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  colored = true,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = true,
  always_visible = true,
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    always_divide_middle = true,
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_b = { branch, diff, diagnostics },
  },
})
