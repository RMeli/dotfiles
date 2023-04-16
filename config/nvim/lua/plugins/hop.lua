-- [[ hop.nvim ]]
-- Neovim motions on speed!
-- https://github.com/phaazon/hop.nvim

return {
  "phaazon/hop.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = true, -- Needed (?), calls require("hop").setup(); equivalent to opts={}
}
