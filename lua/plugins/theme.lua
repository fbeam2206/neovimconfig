return{
  {
    'rose-pine/neovim',
      config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
        }
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
      config = function()
      require("nightfox").setup({
        options = {
          transparent = true
        }
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
      config = function()
      require("tokyonight").setup({
        transparent = true
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        }
      })
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup({
        options  = {
          sidebars = "transparent",
          transparent = true
        }
      })
    end,
  },
  {
    "catppuccin/nvim",
    config = function()
      require('catppuccin').setup({
        transparent_background = true
      })
    end,
  },
  {
    "daltonmenezes/aura-theme",
    name = "aura",
    lazy = false,
    config = function()
    end,
  },
  {
    'bettervim/yugen.nvim',
    name = "yugen",
    config = function()
      require('yugen').setup({})
      vim.cmd.colorscheme('yugen')  -- Then apply colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
           pattern = "yugen",
           callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
      end,
      })
    end,
  },
  {
    'zenbones-theme/zenbones.nvim',
    name = "zenbones",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.g.zenbones = {
        transparent_background = true,
      }
    end,
  }
}
