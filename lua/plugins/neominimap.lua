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
  config = function()
    -- Upstream bug: minimap highlights starting at the first byte of a line
    -- are silently dropped, so an unindented `# comment` / `-- comment` gets
    -- no colour at all while an indented one does.
    --
    -- map/treesitter.lua resolves a highlight's start via
    -- byte_index_to_utf8_index(0, ...) -> 0, then indexes the 1-indexed
    -- codepoints_pos table at [0], gets nil, and skips the highlight. Byte 0
    -- is simply the first visible column, so seed index 0 accordingly.
    -- codepoints_pos has exactly one caller, so this stays contained.
    local text = require("neominimap.map.text")
    local codepoints_pos = text.codepoints_pos
    text.codepoints_pos = function(...)
      local pos = codepoints_pos(...)
      if pos[0] == nil then
        pos[0] = 1
      end
      return pos
    end
  end,
}
