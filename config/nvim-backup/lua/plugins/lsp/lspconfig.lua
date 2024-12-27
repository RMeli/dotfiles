-- [[ nvim-lspconfig ]]
-- Quickstart configs for Nvim LSP
-- https://github.com/neovim/nvim-lspconfig

local b = "rounded" -- define border

require("lspconfig.ui.windows").default_options = {
  border = b,
}

-- [[ capabilities ]]

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
capabilities.offsetEncoding = { "utf-16" }

-- Update cmp capabilities if it is installed
local ok, cmp_nvim_lsp
pcall(require, "cmp_nvim_lsp")
if ok then
  cmp_nvim_lsp.update_capabilities(capabilities)
end

-- [[ signs ]]

-- Define custom signs
-- Using empty icons (full icons are used as git symbols)
local signs = {
  { name = "DiagnosticSignError", text = "󰅘" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "󰝶" },
  { name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- [[ confg ]]
local config = {
  virtual_text = true, -- LSP text appearing after line end
  signs = {
    active = signs,
  },
  update_in_insert = true, -- Update during insert mode
  -- Configure floating window
  float = {
    focusable = false,
    style = "minimal",
    border = b,
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config) -- Apply configurations

-- ------------------ --
-- LSP Configurations --
-- ------------------ --

require("lspconfig").bashls.setup({ capabilities = capabilities })
require("lspconfig").clangd.setup({ capabilities = capabilities })
require("lspconfig").cmake.setup({ capabilities = capabilities })
-- require("lspconfig").dockerls.setup({ capabilities = capabilities })
require("lspconfig").fortls.setup({ capabilities = capabilities })
-- require("lspconfig").julials.setup({ capabilities = capabilities })
require("lspconfig").ltex.setup({ capabilities = capabilities })
require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      completion = {
        showWord = "Disable",
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
require("lspconfig").ltex.setup({ capabilities = capabilities })
require("lspconfig").pyright.setup({ capabilities = capabilities })
require("lspconfig").taplo.setup({ capabilities = capabilities })
require("lspconfig").yamlls.setup({ capabilities = capabilities })
