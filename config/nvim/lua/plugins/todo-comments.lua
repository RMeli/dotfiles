-- [[ todo-comments.nvim ]]
-- Highlight, list and search todo comments in your projects
-- https://github.com/folke/todo-comments.nvim

local ok, TODOc = REQUIRE_PLUGIN("todo-comments")
if not ok then
  return
end

TODOc.setup({
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
})

local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
  wk.register({
    ["<leader>f"] = { name = "+find" },
    ["<leader>ft"] = { "<cmd>:TodoTelescope<cr>", "Find TODOs" },
  })
end
