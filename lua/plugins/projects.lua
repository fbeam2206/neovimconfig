-- plugins/projects.lua
-- Project management. Powers the dashboard "Find project" button
-- (:Telescope projects) and detects project roots automatically.
return {
  "ahmedkhalf/project.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("project_nvim").setup({})
    require("telescope").load_extension("projects")
  end,
}
