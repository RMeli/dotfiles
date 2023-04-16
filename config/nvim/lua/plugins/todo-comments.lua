-- [[ todo-comments.nvim ]]
-- Highlight, list and search todo comments in your projects
-- https://github.com/folke/todo-comments.nvim

return {
  "folke/todo-comments.nvim",
  lazy = false,
  opts = {
    signs = true, -- show icons in the signs column
    keywords = {
      FIX = {
        icon = " ",
        color = "error",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
      TODO = { icon = "", color = "info" },
      HACK = { icon = "", color = "warning" },
      WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
      fg = "NONE",
      bg = "BOLD",
    },
    pattern = [[\b(KEYWORDS):]],
  },
}
