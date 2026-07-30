return{
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "c", "lua", "python", "html", "css" },
        auto_install = true,
        highlight = { enable = true },
        -- Treesitter's C/C++ indent queries leave new lines inside function
        -- bodies at column 0; fall back to Vim's built-in cindent there.
        indent = { enable = true, disable = { "c", "cpp" } },
      })
    end
  }
}
