-- [[ nvim-treesitter ]]
-- Nvim Treesitter configurations and abstraction layer
-- https://github.com/nvim-treesitter/nvim-treesitter

local ok, tsconfig = pcall(require, "nvim-tresitter.configs")
if not ok then
  return
end

tsconfig.setup({
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
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "" } },
})
