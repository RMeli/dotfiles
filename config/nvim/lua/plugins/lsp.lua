-- [[ lspconfig ]]
-- Quickstart configs for Nvim LSP
-- https://github.com/neovim/nvim-lspconfig

-- Define custom signs
-- Using empty icons (full icons are used as git symbols)
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "ﱴ" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
    numhl = "",
  })
end

local b = "rounded"

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  -- When lazy loading, it is imperative to load mason, then mason-lspconfig,
  -- and finally lspconfig
  dependencies = {
    {
      -- [[ mason-lspconfig ]]
      -- Extension to mason.nvim that makes it easier to use lspconfig with
      -- mason.nvim
      -- https://github.com/williamboman/mason-lspconfig.nvim
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

      dependencies = {
        -- [[ mason ]]
        -- Portable package manager for Neovim that runs everywhere Neovim runs
        -- https://github.com/williamboman/mason.nvim
        "williamboman/mason.nvim",
        lazy = true,
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        cmd = "Mason",
        opts = {
          ui = {
            border = b,
            icons = {
              package_installed = "",
              package_pending = "",
              package_uninstalled = "",
            },
          },
        },
      },
    },
    {
      -- [[ neodev ]]
      -- Neovim setup for init.lua and plugin development with full signature
      -- help, docs and completion for the nvim lua API.
      "folke/neodev.nvim",
      opts = {
        experimental = { pathStrict = true },
      },
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      dependencies = { "hrsh7th/nvim-cmp" },
    },
  },
  lazy = false,
  opts = {
    -- options for vim.diagnostic.config()
    diagnostics = {
      virtual_text = { spacing = 4, prefix = "󰄻" },
      signs = {
        active = signs,
      },
      underline = true,
      update_in_insert = false,
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
            --            completion = {
            --              showWord = "Disable",
            --            },
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

  config = function(_, opts)
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
    capabilities.offsetEncoding = { "utf-16" }

    require("cmp_nvim_lsp").default_capabilities(capabilities)

    vim.diagnostic.config(opts.diagnostics)
  end,
}
