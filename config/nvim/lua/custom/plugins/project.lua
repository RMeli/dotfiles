return {
  'ahmedkhalf/project.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    pcall(require('telescope').load_extension, 'projects')
  end,
  keys = {
    { '<leader>sp', '<cmd>Telescope projects<cr>', desc = 'Find Project' },
  },
}
