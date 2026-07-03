-- plugins/projects.lua
-- Project management. Powers the dashboard "Find project" button
-- (:Telescope projects) and detects project roots automatically.
--
-- Uses DrKJeff16/project.nvim, the actively maintained fork of the now-archived
-- ahmedkhalf/project.nvim (which called the deprecated vim.lsp.buf_get_clients()).
return {
  "DrKJeff16/project.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("project").setup({})
    require("telescope").load_extension("projects")
  end,
}
