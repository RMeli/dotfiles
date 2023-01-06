-- [[ nvim-lspconfig ]]
-- Quickstart configs for Nvim LSP
-- https://github.com/neovim/nvim-lspconfig

-- [[ capabilities ]]

-- Allows to add nvim-cmp support to LSPs
local capabilities = :wrequire("cmp_nvim_lsp").default_capabilities()

-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
capabilities.offsetEncoding = { "utf-16" }

-- [[ signs ]]

-- Define custom signs
-- Using empty icons (full icons are used as git symbols)
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "ﱴ" },
    { name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

require("lspconfig").bashls.setup({ capabilities = capabilities })
require("lspconfig").clangd.setup({ capabilities = capabilities })
require("lspconfig").cmake.setup({ capabilities = capabilities })
require("lspconfig").dockerls.setup({ capabilities = capabilities })
require("lspconfig").fortls.setup({ capabilities = capabilities })
require("lspconfig").julials.setup({ capabilities = capabilities })
require("lspconfig").ltex.setup({ capabilities = capabilities })
require("lspconfig").sumneko_lua.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "Lua 5.1",
            },
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
