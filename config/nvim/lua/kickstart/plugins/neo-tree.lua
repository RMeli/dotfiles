-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  lazy = false,
  priority = 9000,
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      hide_dotfiles = false,
      hide_gitignord = false,
      hide_hidden = false,
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        '.DS_Store',
      },
      never_show_by_pattern = { -- uses glob style patterns
        '.null-ls_*',
      },
      hijack_netrw_behavior = 'open_current',
    },
    default_component_configs = {
      modified = {
        symbol = '[+]',
        highlight = 'NeoTreeModified',
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = 'NeoTreeFileName',
      },
      git_status = {
        symbols = {
          added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = '', -- this can only be used in the git_status source
          renamed = '', -- this can only be used in the git_status source
          -- Status type
          untracked = '',
          ignored = '◌',
          unstaged = '',
          staged = '',
          conflict = '',
        },
      },
    },
  },
}
