return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      -- Themery false-positives its "themeConfigFile is deprecated" warning
      -- on Windows: the unset option round-trips through fnamemodify(),
      -- which mangles the v:null sentinel into "v:\null", so the plugin
      -- thinks the option was set. Filter that one message during setup.
      local themery = require("themery")
      local orig_print = _G.print
      _G.print = function(msg, ...)
        if not (type(msg) == "string" and msg:find("themeConfigFile", 1, true)) then
          orig_print(msg, ...)
        end
      end
      local ok, err = pcall(themery.setup, {
        themes = {
          {
            name = "Rose Pine",
            colorscheme = "rose-pine",
          },
          {
            name = "Rose Pine Moon",
            colorscheme = "rose-pine-moon",
          },
          {
            name = "Rose Pine Dawn",
            colorscheme = "rose-pine-dawn",
          },
          {
            name = "Nightfox",
            colorscheme = "nightfox",
          },
          {
            name = "Dawnfox",
            colorscheme = "dawnfox",
          },
          {
            name = "Dayfox",
            colorscheme = "dayfox",
          },
          {
            name = "Duskfox",
            colorscheme = "duskfox",
          },
          {
            name = "Nordfox",
            colorscheme = "nordfox",
          },
          {
            name = "Terafox",
            colorscheme = "terafox",
          },
          {
            name = "Carbonfox",
            colorscheme = "carbonfox",
          },
          {
            name = "Tokyo Night",
            colorscheme = "tokyonight",
          },
          {
            name = "Tokyo Night Storm",
            colorscheme = "tokyonight-storm",
          },
          {
            name = "Tokyo Night Moon",
            colorscheme = "tokyonight-moon",
          },
          {
            name = "Tokyo Night Day",
            colorscheme = "tokyonight-day",
          },
          {
            name = "Kanagawa",
            colorscheme = "kanagawa",
          },
          {
            name = "Kanagawa Wave",
            colorscheme = "kanagawa-wave",
          },
          {
            name = "Kanagawa Dragon",
            colorscheme = "kanagawa-dragon",
          },
          {
            name = "Kanagawa Lotus",
            colorscheme = "kanagawa-lotus",
          },
          {
            name = "GitHub Dark",
            colorscheme = "github_dark",
          },
          {
            name = "GitHub Light",
            colorscheme = "github_light",
          },
          {
            name = "GitHub Dark Default",
            colorscheme = "github_dark_default",
          },
          {
            name = "GitHub Dark Dimmed",
            colorscheme = "github_dark_dimmed",
          },
          {
            name = "Catppuccin Latte",
            colorscheme = "catppuccin-latte",
          },
          {
            name = "Catppuccin Frappe",
            colorscheme = "catppuccin-frappe",
          },
          {
            name = "Catppuccin Macchiato",
            colorscheme = "catppuccin-macchiato",
          },
          {
            name = "Catppuccin Mocha",
            colorscheme = "catppuccin-mocha",
          },
          {
            name = "Aura Dark",
            colorscheme = "aura-dark",
          },
          {
            name = "Aura Soft Dark",
            colorscheme = "aura-soft-dark",
          },
          {
            name = "Aura Dark Soft Text",
            colorscheme = "aura-dark-soft-text",
          },
          {
            name = "Yugen",
            colorscheme = "yugen",
          },
          {
            name = "neobones",
            colorscheme = "neobones",
          },
          {
            name = "vimbones",
            colorscheme = "vimbones",
          },
          {
            name = "rosebones",
            colorscheme = "rosebones",
          },
          {
            name = "forestbones",
            colorscheme = "forestbones",
          },
          {
            name = "nordbones",
            colorscheme = "nordbones",
          },
          {
            name = "tokyobones",
            colorscheme = "tokyobones",
          },
          {
            name = "seoulbones",
            colorscheme = "seoulbones",
          },
          {
            name = "duckbones",
            colorscheme = "duckbones",
          },
          {
            name = "zenburned",
            colorscheme = "zenburned",
          },
          {
            name = "kanagawabones",
            colorscheme = "kanagawabones",
          },
          {
            name = "randombones",
            colorscheme = "randombones",
          },
          {
            name = "Gruber Darker",
            colorscheme = "Gruber-Darker",
          },
          {
            name = "macOS Classic Dark",
            colorscheme = "macos-classic-dark",
          },
        },
      livePreview = true,
      })
      _G.print = orig_print
      if not ok then
        error(err)
      end
    end
  }
