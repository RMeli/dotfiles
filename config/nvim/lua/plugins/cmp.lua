-- [[ cmp-nvim ]]
-- A completion plugin for neovim coded in Lua.
-- https://github.com/hrsh7th/nvim-cmp

-- Require NerdFonts
-- https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
  lazy = false,
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    }
    opts.formatting = {
      -- Set fields in popup window
      -- Order is important
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Define symbols
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- Define menu names for source
        vim_item.menu = ({
          nvim_lsp = "",
          luasnip = "",
          buffer = "﬘",
          path = "",
          nvim_lua = "",
          latex_symbols = "TeX",
        })[entry.source.name]
        return vim_item
      end,
    }
    opts.sources = {
      -- Order is important, this is how they will show up
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "path" },
    }
    opts.mapping = cmp.mapping.preset.insert({
      -- ["<C-k>"] = cmp.mapping.select_prev_item(),
      -- ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable, -- Remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(), -- Insetion mode
        c = cmp.mapping.close(), -- Command mode
      }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    })

    -- Use buffer source for '/' and '?'
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline and path source for ':'
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })

    opts.confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }

    opts.window = {
      completion = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    }
    opts.experimental = {
      ghost_text = true,
      native_menu = false,
    }
  end,
}
