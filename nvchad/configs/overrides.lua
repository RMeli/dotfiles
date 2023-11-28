local M = {}

M.treesitter = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        "json",
        "yaml",
        "toml",

        "c",
        "cpp",
        "fortran",
        "python",
        "cuda",

        "cmake",
        "make",

        "bash",

        "diff",
        "regex",

        "latex",
        "markdown",
        "markdown_inline",

        "dockerfile",
        "doxygen",

        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
      },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "clangd",
    "clang-format",
    "fortls",
    "pyright",

    "cmake-language-server",
    "ltex-ls",
    "bash-language-server",

    "yaml-language-server",
 },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
