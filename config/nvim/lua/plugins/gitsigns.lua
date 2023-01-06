-- [[ gitsigns ]]
-- Git integration for buffers
-- https://github.com/lewis6991/gitsigns.nvim

require("gitsigns").setup({
  signs = {
    add = {
      hl = "GitSignsAdd",
      text = "",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
    change = {
      hl = "GitSignsChange",
      text = "",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      hl = "GitSignsDelete",
      text = "",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    -- First line of file deleted
    topdelete = {
      hl = "GitSignsDelete",
      text = "",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    -- Modified lines occupying same space as deleted lines
    changedelete = {
      hl = "GitSignsChange",
      text = "",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    untracked = {
      hl = "GitSignsAdd",
      text = "",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 500,
    ignore_whitespace = true,
  },
})
