-- [[ keymaps ]]
-- LSP-based keymaps

local ok, _ = REQUIRE_PLUGIN("lspconfig")
if not ok then
  return
end

-- TODO: Make this work without which-key
local wk_ok, wk = REQUIRE_PLUGIN("which-key")
local tb_ok, tb = REQUIRE_PLUGIN("telescope.builtin")

if wk_ok and tb_ok then
  wk.add({
    { "<leader>l",  group = "LSP" },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>",                         desc = "LSP Install Info" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",          desc = "Code Action" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", desc = "Format File" },
    { "<leader>li", "<cmd>LspInfo<cr>",                                desc = "LSP Info" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",               desc = "Rename" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>",       desc = "Signature Help" },
    { "gD",         "<cmd>lua vim.lsp.buf.declaration()<cr>",          desc = "Go to Declatation" },
    { "gI",         "<cmd>lua vim.lsp.buf.implementation()<cr>",       desc = "Go to Implementation" },
    { "gd",         "<cmd>lua vim.lsp.buf.definition()<cr>",           desc = "Go to Definition" },
    { "gr",         tb.lsp_references,                                 desc = "Go to references" },
  })
end
