return{
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets"
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim", -- icons in the completion menu
      "hrsh7th/cmp-nvim-lsp", -- LSP completion source
      "hrsh7th/cmp-buffer",   -- current-buffer words source
      "hrsh7th/cmp-path",     -- filesystem path source
      "saadparwaiz1/cmp_luasnip", -- snippet completion source
    },
    config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    require("luasnip.loaders.from_vscode").lazy_load()
    vim.opt.pumheight = 7
    cmp.setup({
      performance = {
        max_view_entries = 1000,  -- Limit to 7 items shown at once
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        -- No `border` key: on nvim 0.11+ bordered() falls back to
        -- vim.o.winborder (set in init.lua), so these match every other float.
        completion = cmp.config.window.bordered({
              max_width = 50,
              scrollbar = false,
              max_height = 7,
            }),
        documentation = cmp.config.window.bordered({
              max_width = 40,
            }),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
        })
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      },
      {
        { name = 'buffer' },
        { name = 'path' }, -- filesystem path source (cmp-path)
      })
    })
  end,
  }
}
