-- [[ gitsigns ]]
-- Git integration for buffers
-- https://github.com/lewis6991/gitsigns.nvim

local ok, gitsigns = REQUIRE_PLUGIN("gitsigns")
if not ok then
  return
end

gitsigns.setup({
  signs = {
    add = {
      text = "",
    },
    change = {
      text = "",
    },
    delete = {
      text = "",
    },
    -- First line of file deleted
    topdelete = {
      text = "",
    },
    -- Modified lines occupying same space as deleted lines
    changedelete = {
      text = "",
    },
    untracked = {
      text = "",
    },
  },
  numhl = true, -- Highlight numbers
  linehl = false, -- Highlight lines
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 500,
    ignore_whitespace = true,
  },
})
