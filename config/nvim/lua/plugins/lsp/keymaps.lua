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
  wk.register({
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to Declatation" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition" },
    ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation" },
    ["gr"] = { tb.lsp_references, "Go to references" },
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
    ["<leader>la"] = {
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      "Code Action",
    },
  })
end
