return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle neo-tree" },
  },
  opts = {
    close_if_last_window = true,
    window = {
      width = 18,
    },
    -- Mimic Zed's project panel: outline folders, chevron expanders, and
    -- git status conveyed by name color only (no symbols).
    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        folder_empty_open = "",
        default = "",
      },
      indent = {
        expander_collapsed = "",
        expander_expanded = "",
      },
      git_status = {
        symbols = {
          added = "",
          modified = "",
          deleted = "",
          renamed = "",
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
    },
  },
}
