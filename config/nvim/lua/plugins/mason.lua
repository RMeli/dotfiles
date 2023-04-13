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

return {
  "williamboman/mason.nvim",
  lazy = true,
  cmd = "Mason",
  opts = {
    ui = {
      border = "rounded",
      icons = {
        package_installed = "",
        package_pending = "",
        package_uninstalled = "",
      },
    },
  },

  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          --        "bashls", -- Bash
          --        "clangd", -- C and C++
          --        "cmake", -- CMake
          --        "dockerls", -- Docker
          --        "fortls", -- Fortran
          --        "julials", -- Julia
          --        "ltex", -- LaTeX
          "lua_ls", -- Lua
          --        "pyright", -- Python
          --        "taplo", -- TOML
          --        "yamlls", -- YAML
        },
      },
    },
  },
}
