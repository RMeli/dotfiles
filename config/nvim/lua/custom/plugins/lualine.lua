return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local branch = {
      'branch',
      icons_enabled = true,
      icon = '',
    }

    -- git diff
    -- Updates only when buffer is saved
    local diff = {
      'diff',
      symbols = { added = ' ', modified = '󰆗 ', removed = ' ' }, -- changes diff symbols
      colored = true,
    }

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = '󰅘 ', warn = ' ' },
      colored = true,
      update_in_insert = true,
      always_visible = false,
    }
    lualine = require 'lualine'

    lualine.setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        always_divide_middle = true,
        disabled_filetypes = { 'NvimTree' },
      },
      sections = {
        -- https://github.com/nvim-lualine/lualine.nvim#available-components
        lualine_b = { branch, diff, diagnostics },
        lualine_c = { 'filename' },
        lualine_y = { 'searchcount', 'progress', 'location' },
        lualine_z = { 'hostname' },
      },
    }
  end,
}
