return {
  'hadronized/hop.nvim',
  config = true,
  keys = {
    { '<leader>ha', '<cmd>HopAnywhere<cr>', desc = 'Hop anywhere' },
    { '<leader>hc', '<cmd>HopChar1<cr>', desc = 'Hop to char' },
    { '<leader>hl', '<cmd>HopLine<cr>', desc = 'Hop to line' },
    { '<leader>hs', '<cmd>HopLineStart<cr>', desc = 'Hop to line start' },
    { '<leader>hw', '<cmd>HopWord<cr>', desc = 'Hop to word' },
  },
}
