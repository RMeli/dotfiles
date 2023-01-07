-- [[ nvim-treesitter ]]
-- Nvim Treesitter configurations and abstraction layer
-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "cuda",
    "latex",
    "lua",
    "make",
    "markdown",
    "python",
    "toml",
    "vim",
    "yaml",
  },
  auto_install = true, -- automatically install missing parsers
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python" } },
})
