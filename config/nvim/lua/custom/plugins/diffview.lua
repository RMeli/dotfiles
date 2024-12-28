return {
  'sindrets/diffview.nvim',
  config = true,
  keys = {
    { '<leader>gx', '<cmd>DiffviewOpen<cr>', desc = 'Open diff view' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'File history' },
    { '<leader>gq', '<cmd>DiffviewClose<cr>', desc = 'Close diff view' },
  },
}
