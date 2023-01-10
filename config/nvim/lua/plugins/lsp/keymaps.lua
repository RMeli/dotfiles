-- [[ keymaps ]]
-- LSP-based keymaps

local ok, _ = REQUIRE_PLUGIN("lspconfig")
if not ok then
  return
end

-- TODO: Make this work without which-key
local wk_ok, wk = REQUIRE_PLUGIN("which-key")
if wk_ok then
  wk.register({
    ["gD"] = { "<cmd>lua vim.lsp.buf.declatation()<cr>", "Go to Declatation" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition" },
    ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation" },
    ["gl"] = { "<cmd>lua vim.lsp.buf.diagnostic()<cr>", "Diagnostic Float Window" },
    -- LSP group
    ["<leader>l"] = { name = "+LSP" },
    ["<leader>lf"] = {
      "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
      "Format File",
    },
    ["<leader>li"] = {
      "<cmd>LspInfo<cr>",
      "LSP Info",
    },

    ["<leader>lI"] = {
      "<cmd>LspInstallInfo<cr>",
      "LSP Install Info",
    },
    ["<leader>lr"] = {
      "<cmd>lua vim.lsp.buf.rename()<cr>",
      "Rename",
    },
    ["<leader>ls"] = {
      "<cmd>lua vim.lsp.buf.signature_help()<cr>",
      "Signature Help",
    },
  })
end

-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
-- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
-- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
