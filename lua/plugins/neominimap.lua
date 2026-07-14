return
{
  "Isrothy/neominimap.nvim",
  version = "v3.x.x",
  lazy = false, -- NOTE: NO NEED to lazy load with this plugin
  keys = {
    { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
    { "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
    { "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
    { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },
    { "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
    { "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
  },
  init = function()
    -- The plugin recommends these settings
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    vim.g.neominimap = {
      auto_enable = true,
    }
  end,
}
