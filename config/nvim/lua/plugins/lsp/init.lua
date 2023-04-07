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
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        virtual_text = true, -- LSP text appearing after line end
        signs = {
          active = signs,
        },
        underline = true,
        update_in_insert = false,
        --        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = b,
          source = "always",
          header = "",
          prefix = "",
        },
      },
      -- autoformat = true, -- autoformat on save

      -- options for vim.lsp.buf.format
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },

      -- LSP Server Settings
      servers = {
        bashls = {},
        clangd = {},
        cmake = {},
        fortls = {},
        ltex = {},
        lua_ls = {
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
        },
        pyright = {},
        yamlls = {},
      },
    },

    config = function(plugin, opts)
      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
      capabilities.offsetEncoding = { "utf-16" }

      local ok, cmp_nvim_lsp
      pcall(require, "cmp_nvim_lsp")
      if ok then
        cmp_nvim_lsp.update_capabilities(capabilities)
      end

      vim.diagnostic.config(opts.diagnostics)
    end,
  },

  {
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
          --        "lua_ls", -- Lua
          --        "pyright", -- Python
          --        "taplo", -- TOML
          --        "yamlls", -- YAML
        },
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    opts = function()
      local nls = require("null-ls")
      local formatting = nls.builtins.formatting
      local diagnostics = nls.builtins.diagnostics
      return {
        border = "rounded",
        sources = {
          -- Lua
          formatting.stylua.with({
            extra_args = { "--indent-width", "2", "--indent-type", "Spaces" },
          }),
          -- C/C++/CUDA
          -- null_ls.builtins.diagnostics.clang_check,
          formatting.clang_format,
          -- CMake
          formatting.cmake_format,
          -- Fortran
          formatting.fprettify,
          -- Python
          formatting.black,
          formatting.isort,
          diagnostics.flake8,
          diagnostics.mypy,
        },
      }
    end,
    opts = function(_, opts) end,
  },
}
