-- plugins/telescope.lua
-- Fuzzy finder. Keymaps live in init.lua; the ui-select extension is set
-- up in tele-ui.lua.
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
}
